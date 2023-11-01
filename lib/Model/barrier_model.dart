class BarrierModel {
  final int id;
  final String deviceid;
  final String manual;
  final String barrierControl;
  final String warning;
  final String uptime;

  BarrierModel({
    required this.id,
    required this.deviceid,
    required this.manual,
    required this.barrierControl,
    required this.warning,
    required this.uptime
  });
  factory BarrierModel.fromJson(Map<String, dynamic> json) {
    return BarrierModel(
      id: json['id'],
      deviceid: json['deviceid'],
      manual: json['manual'],
      barrierControl: json['barrier_control'],
      warning: json['warning'],
      uptime: json['uptime'],
    );
  }
}