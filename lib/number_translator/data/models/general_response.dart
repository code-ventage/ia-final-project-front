class GeneralResponse<T> {
  final String error;
  final T data;

  GeneralResponse({
    required this.error,
    required this.data,
  });
}