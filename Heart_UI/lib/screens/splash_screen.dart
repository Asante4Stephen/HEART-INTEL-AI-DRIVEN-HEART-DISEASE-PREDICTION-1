import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isExiting = false; 

  @override
  void initState() {
    super.initState();
  
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isExiting = true;
      });

      
      Future.delayed(const Duration(milliseconds: 800), () {
        Navigator.pushReplacementNamed(context, '/getStarted');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
  
    ScreenUtil.init(context, designSize: const Size(375, 812), minTextAdapt: true);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/1.png'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: MouseRegion(
            onEnter: (_) => _onHover(true),
            onExit: (_) => _onHover(false),
            child: AnimatedScale(
              scale: _isExiting ? 0.8 : 1.05, // Slightly enlarge on entry
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                opacity: _isExiting ? 0.0 : 1.0, 
                duration: const Duration(milliseconds: 500),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                 
                    Image.asset(
                      'assets/logo.png',
                      width: 200.w, 
                      height: 200.w, 
                    ),
                    SizedBox(height: 20.h), 
                   
                    FittedBox(
                      fit: BoxFit
                          .scaleDown, 
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                              fontFamily: 'Poppins',
                              color: _isHovered
                                  ? Colors.yellow
                                  : AppColors.whiteColor,
                              shadows: _isHovered
                                  ? [
                                      Shadow(
                                          blurRadius: 20.0,
                                          color: Colors.black45,
                                          offset: Offset(5.0.w, 5.0.h))
                                    ]
                                  : [
                                      Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black26,
                                          offset: Offset(3.0.w, 3.0.h))
                                    ],
                              fontSize: 42.sp, 
                            ),
                        child: const Text(
                          'HEART DISEASE DIAGNOSIS',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
