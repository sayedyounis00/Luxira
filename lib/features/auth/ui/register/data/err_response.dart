class ErrResponse {
  final String message;

  ErrResponse({required this.message});

  factory ErrResponse.fromJson(json) {
    return ErrResponse(message: json['message']);
  }
}
