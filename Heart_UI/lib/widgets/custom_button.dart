import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final Border? border;
  final double elevation;
  final bool isLoading; 

  const CustomButton({super.key, 
    required this.text,
    required this.onPressed,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.borderRadius = 0.0, 
    this.border,
    this.elevation = 5.0,
    this.isLoading = false, required String label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: 20.h, horizontal: 40.w), 
        minimumSize: Size(300.w, 60.h), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), 
          side: border != null
              ? BorderSide(color: border!.top.color, width: border!.top.width)
              : BorderSide.none,
        ),
        elevation: elevation,
        backgroundColor: color,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      child: isLoading
          ? SizedBox(
              height: 30.0, 
              width: 30.0,
              child: CircularProgressIndicator(
                color: textColor,
                strokeWidth: 3.0,
              ),
            )
          : Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20.sp, 
                color: textColor,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
    );
  }
}
