class DataModel {
  final int datanumber;
  final String license;
  final String deviceid;
  final String address;
  final String barrierValue;
  final double waterValue;
  final double tempValue;
  final double humiValue;
  final String uptime;

  DataModel({
    required this.datanumber,
    required this.license,
    required this.deviceid,
    required this.address,
    required this.barrierValue,
    required this.waterValue,
    required this.tempValue,
    required this.humiValue,
    required this.uptime,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      datanumber: json['data_number'],
      license: json['license'],
      deviceid: json['device_id'],
      address: json['address'],
      barrierValue: json['barrier_value'],
      waterValue: json['water_value'],
      tempValue: json['temp_value'],
      humiValue: json['humi_value'],
      uptime: json['uptime'],
    );
  }
}