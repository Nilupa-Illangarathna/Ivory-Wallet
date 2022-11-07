import 'package:flutter/material.dart';

class DoughnutChartData {
  DoughnutChartData(this.x, this.y,this.Lables, [this.color]);
  final String x;
  final double y;
  final double Lables;
  final Color? color;
}

class RadialBarChartData {
  RadialBarChartData(this.x, this.y,this.color);
  final String x;
  final double y;
  final Color? color;
}