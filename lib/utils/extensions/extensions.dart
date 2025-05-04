import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

extension Space on num {
  SizedBox get ph => SizedBox(height: toDouble().h);

  SizedBox get pw => SizedBox(width: toDouble().w);
}

String formatDateTime(String isoDate) {
  DateTime dateTime = DateTime.parse(isoDate).toLocal();
  return DateFormat('dd MMMM, yyyy – HH:mm').format(dateTime);
}
