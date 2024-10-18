import 'package:flutter/material.dart';
import 'package:insta_med_ui/components/Section%20Header.dart';

class PopularDoctorsSection extends StatelessWidget {
  const PopularDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Popular Doctors'),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DoctorCard(name: 'Gemma Davis', specialty: 'Cardiologist', rating: 4.8),
            DoctorCard(name: 'John Smith', specialty: 'Pediatrician', rating: 4.5),
          ],
        ),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;

  const DoctorCard({super.key, required this.name, required this.specialty, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12),
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
        ),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.teal,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(specialty, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),
            Text('Rating: $rating'),
          ],
        ),
      ),
    );
  }
}
