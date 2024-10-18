import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedServicesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> featuredServices = [
    {
      'image': 'assets/images/doctor1.jpg',
      'label': 'Dr. Janet Quayson',
      'specialty': 'Cardiology',
    },
    {
      'image': 'assets/images/doctor2.jpg',
      'label': 'Dr. James Fiifi Quayson',
      'specialty': 'ECG Specialist',
    },
  ];

  const FeaturedServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = screenWidth * 0.9; // 90% of screen width for card
    const Color primaryColor = Color(0xFF1259e4);
    const Color textColor = Color(0xFF073169);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Ensure Column fits its content
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Doctors',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: textColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/allFeaturedServices');
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: 280.h, // Adjust height based on screen size
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: featuredServices.length,
              itemBuilder: (context, index) {
                final service = featuredServices[index];
                return Container(
                  width: cardWidth, // Dynamic card width
                  margin: EdgeInsets.only(right: 16.w),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(8.w)),
                          child: Image.asset(
                            service['image'],
                            width: double.infinity,
                            height: 150.h, // Adjust height for image
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service['label'],
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                service['specialty'],
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
