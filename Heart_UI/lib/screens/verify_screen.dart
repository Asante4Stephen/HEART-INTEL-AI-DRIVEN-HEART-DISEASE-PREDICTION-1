import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_med_ui/theme/colors.dart';
import 'package:insta_med_ui/widgets/custom_button.dart';
import 'package:insta_med_ui/widgets/base.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool isHovered = false;
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _sendVerificationEmail() async {
    setState(() {
      _isLoading = true;
    });

    try {
     
      User? user = _auth.currentUser;

      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Verification email sent to ${user.email}.'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email already verified.')),
          );
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user is currently logged in.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification failed: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      isLoading: _isLoading,
      child: Scaffold(
        body: Stack(
          children: [
            
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      const AssetImage('assets/1.png'), 
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), 
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
           
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  Image.asset(
                    'assets/logo.png', 
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'We have sent a verification link to your email address. Please check your inbox.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold, 
                          fontSize: 18,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'Resend Verification Email',
                    onPressed: _sendVerificationEmail,
                    isLoading: _isLoading, 
                    color:
                        AppColors.accentColor,
                    textColor: AppColors.whiteColor,
                    borderRadius: 30.0,
                    border: Border.all(color: AppColors.whiteColor, width: 2), label: '',
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      'Back to Login',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
