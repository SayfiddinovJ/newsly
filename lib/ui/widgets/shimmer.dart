import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListTile(
        leading: Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        title: Container(
          height: 16.h,
          width: double.infinity,
          color: Colors.white,
        ),
        subtitle: Container(
          height: 14.h,
          width: double.infinity,
          margin: EdgeInsets.only(top: 8.h),
          color: Colors.white,
        ),
      ),
    );
  }
}
