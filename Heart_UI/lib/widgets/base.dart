import 'package:flutter/material.dart';
import 'package:insta_med_ui/widgets/Loading.dart';


class BaseScreen extends StatefulWidget {
  final Widget child;
  final bool isLoading;

  const BaseScreen({super.key, required this.child, required this.isLoading});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.isLoading) LoadingWidget(isLoading: widget.isLoading),
      ],
    );
  }
}
