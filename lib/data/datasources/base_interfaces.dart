abstract interface class BaseLocalInterface<T> {
  Future<List<T>> getCachedModels();
  Future<void> setCachedModels(List<T> models);
}
