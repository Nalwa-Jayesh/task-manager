import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCard extends StatelessWidget {
  final Color color;
  final String headerText;
  final String descriptionText;

  const TaskCard({
    super.key,
    required this.color,
    required this.headerText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 10.w,
      ),
      padding: EdgeInsets.all(20.w), // Responsive padding
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.r), // Responsive border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerText,
            style: TextStyle(
              fontSize: 20.sp, // Responsive text size
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            descriptionText,
            style: TextStyle(
              fontSize: 14.sp, // Responsive text size
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
