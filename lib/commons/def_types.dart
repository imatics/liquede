
typedef APIAction<T> = void Function(T);
typedef Operation2<T> = T Function(T,{dynamic data});
typedef Operation<T> = Future<bool> Function();

