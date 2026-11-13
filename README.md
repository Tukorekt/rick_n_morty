# Rick & Morty Explorer

Небольшое Flutter-приложение для просмотра персонажей вселенной «Рик и Морти»: список с постраничной загрузкой, поиск по имени, офлайн-кэш и экран с подробной информацией о персонаже.

Данные берутся из публичного [Rick and Morty API](https://rickandmortyapi.com/documentation).

## Возможности

- **Список персонажей** с бесконечной прокруткой — следующая страница подгружается по мере приближения к концу списка.
- **Поиск по имени** прямо из AppBar; при пустом запросе результаты очищаются, а закрытие поиска возвращает обычный список.
- **Экран деталей**: изображение, статус, вид, происхождение и текущая локация.
- **Офлайн-режим списка**: последняя загруженная страница персонажей кэшируется в `SharedPreferences` и показывается при отсутствии сети.
- **Понятные состояния**: загрузка, пустой результат, ошибка сети.
- **Современный UI**: Material 3, градиентный AppBar, карточки, статус-чипы, Hero-анимация изображения.

## Архитектура

Проект построен по принципам Clean Architecture и разделён на три слоя:

```
lib/
├── app/                  # Точка сборки приложения
│   ├── di/               # DI: injectable + get_it
│   ├── routing/          # auto_route: маршруты и генерация
│   ├── themes/           # тема и ThemeExtension
│   ├── app.dart          # MaterialApp и тема
│   └── init.dart         # Инициализация зависимостей
├── common/               # Общие абстракции
│   ├── blocs/            # BaseCubit + BaseCubitState (Init/Loading/Success/Failure)
│   ├── errors/           # Иерархия AppException
│   ├── network/          # Проверка подключения
│   ├── usecase/          # Интерфейс UseCase
│   └── utils/            # Вспомогательные расширения
├── data/                 # Реализация работы с данными
│   ├── datasources/      # CharactersApi (Dio) и CharactersLocal (SharedPreferences)
│   ├── models/           # Freezed/JSON-модели
│   └── repositories/     # Реализация репозитория, ResolveMixin
├── domain/               # Бизнес-логика, не зависит от Flutter и data
│   ├── entities/         # Чистые сущности (Equatable)
│   ├── interfaces/       # Контракт репозитория
│   └── usecase/          # GetCharacters, SearchCharacters
└── presentation/         # UI и состояние
    ├── characters_list/  # Cubit, состояние, экран списка
    ├── search_characters/# Cubit и состояние поиска
    ├── character_details/# Экран деталей
    └── common_widgets/   # Карточки, изображения, AppBar, состояния
```

Поток данных:

```
UI → Cubit → UseCase → Repository ──→ Remote API (Dio)
                                  └──→ Local cache (SharedPreferences)
```

- Слой `domain` не знает о Flutter, Dio и `SharedPreferences`.
- Репозиторий возвращает `BaseEntity<T>`: либо сущность, либо `AppException`.
- `ResolveMixin` выбирает источник данных в зависимости от наличия сети и превращает ошибки в `BaseEntity.exception`.
- `BaseCubitState` описывает единый жизненный цикл экрана: `Init → Loading → Success | Failure`.

## Стек

| Категория | Пакеты |
|-----------|--------|
| UI | Flutter, Material 3, `flutter_bloc`, `cached_network_image`, `visibility_detector` |
| Навигация | `auto_route` |
| Состояние | `flutter_bloc` (Cubit), `freezed` |
| DI | `get_it`, `injectable` |
| Сеть | `dio`, `connectivity_plus` |
| Хранение | `shared_preferences` |
| Модели | `freezed`, `json_serializable`, `equatable` |
| Темы | `theme_extensions_builder` |

## Требования

- Flutter 3.47+ (Dart 3.13+)
- Android / iOS / Web / Desktop — проект кроссплатформенный, основной таргет проверки — Android.

## Запуск

```bash
flutter pub get

# Генерация кода (Freezed, JSON, injectable, auto_route, тема)
dart run build_runner build --delete-conflicting-outputs

# Запуск с конфигурацией окружения
flutter run --dart-define-from-file=env/base_env.json
```

`env/base_env.json` содержит адрес API:

```json
{
  "BASE_URL": "https://rickandmortyapi.com/api"
}
```

Без `--dart-define-from-file` значение `BASE_URL` будет пустым, и запросы не будут работать.

## Тесты

В проекте 80 unit- и widget-тестов: модели, конвертация ответов, локальный кэш, репозиторий, use case, Cubit'ы, виджеты и навигация.

```bash
flutter test
flutter analyze
```

Тесты используют ручные фейки (`FakeCharactersApi`, `FakeCharactersLocal`, `FakeNetworkInfo`, `FakeCharactersRepository`) без внешних mock-библиотек. Общие фикстуры и билдеры лежат в `test/helpers/test_data.dart`.

## Особенности реализации

- **Постраничная загрузка.** Номер следующей страницы вычисляется из `info.next` API, а если его нет — из количества уже загруженных элементов (`length ~/ pageSize + 1`).
- **Защита от дублирующих запросов.** Пока Cubit находится в состоянии `Loading`, повторные вызовы игнорируются (кроме принудительного сброса в поиске).
- **Кэш.** При успешном ответе список персонажей сохраняется в `SharedPreferences`; при потере сети репозиторий отдаёт кэш. Кэшируется последняя запрошенная страница.
- **Ошибки.** `DioException`, неверный статус, некорректный JSON и ошибки кэша приводятся к наследникам `AppException` и отображаются состоянием `Failure`.

## Возможные улучшения

- Debounce для поискового запроса и отмена устаревших запросов.
- Полноценное кэширование всех загруженных страниц и TTL.
- Пагинация через `SliverGrid`/адаптивная сетка на планшетах.
- Локализация интерфейса (сейчас тексты на русском захардкожены).
- CI с `flutter analyze` и `flutter test`.
