class ApiResponse<T> {
  final String message;
  final bool success;

  T? data;

  ApiResponse(this.message, this.success, [this.data]);
}

