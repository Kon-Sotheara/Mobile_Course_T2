class AsyncValue<T> {
  final T? data;
  final Object? error;
  final AsyncValueState state;

  AsyncValue.loading()
    : data = null,
      error = null,
      state = AsyncValueState.loading;

  AsyncValue.error(this.error) : data = null, state = AsyncValueState.error;

  AsyncValue.sucess(this.data) : error = null, state = AsyncValueState.sucess;
}

enum AsyncValueState { loading, error, sucess }
