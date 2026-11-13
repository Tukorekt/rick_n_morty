import 'package:flutter/material.dart';
import 'package:rick_n_morty/app/themes/app_theme.dart';
import 'package:rick_n_morty/presentation/common_widgets/app_icon_button.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

class AppBarWithSearch extends StatefulWidget implements PreferredSizeWidget {
  final void Function(bool isOpened) onSearchTap;
  final void Function(String? value) onSearch;
  final bool isSearchperformed;

  const AppBarWithSearch({
    super.key,
    required this.onSearchTap,
    required this.isSearchperformed,
    required this.onSearch,
  });

  @override
  State<AppBarWithSearch> createState() => _AppBarWithSearchState();

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class _AppBarWithSearchState extends State<AppBarWithSearch> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      flexibleSpace: const DecoratedBox(
        decoration: BoxDecoration(gradient: appBarGradient),
      ),
      titleSpacing: padding16,
      title: widget.isSearchperformed
          ? _SearchField(onChanged: widget.onSearch)
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Список персонажей',
                  style: context.appTheme.appBarTitleTextStyle,
                ),
                Text(
                  'Вселенная Рика и Морти',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .72),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
      actions: [
        AppIconButton(
          onTap: () => widget.onSearchTap(!widget.isSearchperformed),
          icon: widget.isSearchperformed ? Icons.close : Icons.search,
          iconColor: context.appTheme.appBarIconsColor,
        ),
      ],
      actionsPadding: const EdgeInsets.only(right: padding8),
    );
  }
}

class _SearchField extends StatelessWidget {
  final void Function(String? value) onChanged;

  const _SearchField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      minLines: 1,
      autofocus: true,
      textInputAction: TextInputAction.search,
      cursorColor: accentColor,
      style: const TextStyle(color: primaryTextColor, fontSize: 15),
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 44),
        hintText: 'Поиск персонажей',
        hintStyle: const TextStyle(color: secondaryTextColor, fontSize: 14),
        prefixIcon: const Icon(
          Icons.search_rounded,
          size: 20,
          color: accentSoftColor,
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: padding16,
          vertical: padding8,
        ),
        border: const OutlineInputBorder(
          borderRadius: border16,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: border16,
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: border16,
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
