import 'dart:async';

typedef Debounceable<S, T> = FutureOr<S?> Function(T parameter);

class Debouncer {
  static Debounceable<S, T> debounce<S, T>({
    required Duration debounceDuration,
    required Debounceable<S?, T> function,
  }) {
    _DebounceTimer? debounceTimer;

    return (T parameter) async {
      if (debounceTimer != null && !debounceTimer!.isCompleted) {
        debounceTimer!.cancel();
      }

      debounceTimer = _DebounceTimer(debounceDuration: debounceDuration);

      try {
        await debounceTimer!.future;
      } on _CancelException {
        return null;
      }
      return function(parameter);
    };
  }
}

class _DebounceTimer {
  _DebounceTimer({
    required Duration debounceDuration,
  }) {
    _timer = Timer(debounceDuration, _onComplete);
  }

  late final Timer _timer;
  final Completer<void> _completer = Completer<void>();

  void _onComplete() {
    _completer.complete();
  }

  Future<void> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void cancel() {
    _timer.cancel();
    _completer.completeError(const _CancelException());
  }
}

class _CancelException implements Exception {
  const _CancelException();
}
