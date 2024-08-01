class BaseBlocException implements Exception {
  const BaseBlocException(this.code, this.message);

  final int code;
  final String message;

  bool get isUnauthorized => code == 401;

  bool get barrierDismissible => !isUnauthorized;

  @override
  String toString() => '[$runtimeType] $code: $message';
}
