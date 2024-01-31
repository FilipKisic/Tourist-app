class RouteError implements Exception {
  final String cause;

  const RouteError(this.cause);
}