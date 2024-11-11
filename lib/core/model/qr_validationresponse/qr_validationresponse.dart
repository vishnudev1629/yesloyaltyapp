class QrValidationresponse {
  final int? status;
  final String? message;
  final Data? data;
  final List<dynamic>? misc;
  final dynamic redirect;

  QrValidationresponse({
    this.status,
    this.message,
    this.data,
    this.misc,
    this.redirect,
  });

  factory QrValidationresponse.fromJson(Map<String, dynamic> json) {
    return QrValidationresponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] is Map<String, dynamic> ? Data.fromJson(json['data']) : null,
      misc: json['misc'] != null ? List<dynamic>.from(json['misc']) : null,
      redirect: json['redirect'],
    );
  }
}

class Data {
  final List<String>? qrId;

  Data({this.qrId});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      qrId: json['qr_id'] != null ? List<String>.from(json['qr_id']) : null,
    );
  }
}
