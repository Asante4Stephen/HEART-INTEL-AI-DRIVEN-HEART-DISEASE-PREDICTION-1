import 'package:flutter/material.dart';
import 'package:insta_med_ui/components/Section%20Header.dart';

class TopHospitalsSection extends StatelessWidget {
  const TopHospitalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Top Hospitals'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
            image: const DecorationImage(
              image: AssetImage('assets/hospital.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
