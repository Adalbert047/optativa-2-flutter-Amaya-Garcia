abstract class UseCase<T, P> {
  Future<P> execute(T params);
}
