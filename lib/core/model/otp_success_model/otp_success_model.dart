class OtpVerificationResponse {
  int status;
  String message;
  OtpVerificationData data;
  List<dynamic> misc;
  dynamic redirect;

  OtpVerificationResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.misc,
    required this.redirect,
  });

  factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
    return OtpVerificationResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      data: OtpVerificationData.fromJson(json['data']),
      misc: List<dynamic>.from(json['misc']),
      redirect: json['redirect'],
    );
  }
}

class OtpVerificationData {
  bool success;
  String rememberToken;

  OtpVerificationData({
    required this.success,
    required this.rememberToken,
  });

  factory OtpVerificationData.fromJson(Map<String, dynamic> json) {
    return OtpVerificationData(
      success: json['success'] as bool,
      rememberToken: json['remember_token'] as String,
    );
  }
}
