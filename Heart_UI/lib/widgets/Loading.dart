import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;

  const LoadingWidget({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Lottie.asset(
              'assets/loading.json',
              width: 120,
              height: 120,
            ),
          )
        : const SizedBox.shrink();
  }
}
