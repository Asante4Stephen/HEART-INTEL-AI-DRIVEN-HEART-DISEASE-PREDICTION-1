import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {'icon': 'assets/icons/symptom.png', 'label': 'Symptom'},
    {'icon': 'assets/icons/appointment.png', 'label': 'Appointment'},
    {'icon': 'assets/icons/heart_rate.png', 'label': 'Heart Rate'},
  ];

  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Heart Health Services',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/allServices');
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.w,
              crossAxisSpacing: 6.w,
              childAspectRatio: 1.0,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  switch (services[index]['label']) {
                    case 'Symptom':
                      Navigator.pushNamed(context, '/symptomCheck');
                      break;
                    case 'Appointment':
                      Navigator.pushNamed(context, '/appointments');
                      break;
                    case 'Heart Rate':
                      Navigator.pushNamed(context, '/heartRate');
                      break;
                  }
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30.w,
                      backgroundColor: Colors.grey[200],
                      child: Image.asset(
                        services[index]['icon'],
                        width: 50.w,
                        height: 50.w,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      services[index]['label'],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
