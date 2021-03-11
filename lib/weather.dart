import 'package:flutter/cupertino.dart';

class Weather{
  final String cityName;
  final double temperatureCelius;

  Weather({@required this.cityName, @required this.temperatureCelius});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weather &&
          runtimeType == other.runtimeType &&
          cityName == other.cityName &&
          temperatureCelius == other.temperatureCelius;

  @override
  int get hashCode => cityName.hashCode ^ temperatureCelius.hashCode;
}