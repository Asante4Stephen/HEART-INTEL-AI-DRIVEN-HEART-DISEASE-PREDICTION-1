import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_med_ui/theme/colors.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_med_ui/widgets/custom_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Future<void> _changePassword() async {
    final User? user = _auth.currentUser;

    if (user == null) {
      // Handle the case where the user is not logged in
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in')),
      );
      return;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
      // Handle the case where new passwords do not match
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New passwords do not match')),
      );
      return;
    }

    try {
      // Reauthenticate user
      final AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: _currentPasswordController.text,
      );
      await user.reauthenticateWithCredential(credential);

      // Update password
      await user.updatePassword(_newPasswordController.text);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password changed successfully')),
      );
      
      // Optionally, navigate the user or log them out
      // Navigator.of(context).pop();
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to change password: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: AppColors.primaryColor, 
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildPasswordTextField(
              'Current Password',
              _isCurrentPasswordVisible,
              () => setState(() => _isCurrentPasswordVisible = !_isCurrentPasswordVisible),
              controller: _currentPasswordController,
            ),
            buildPasswordTextField(
              'New Password',
              _isNewPasswordVisible,
              () => setState(() => _isNewPasswordVisible = !_isNewPasswordVisible),
              controller: _newPasswordController,
            ),
            buildPasswordTextField(
              'Confirm New Password',
              _isConfirmPasswordVisible,
              () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
              controller: _confirmPasswordController,
            ),
            SizedBox(height: 24.0.h), 
            CustomButton(
              text: 'Change Password',
              onPressed: _changePassword,
              color: AppColors.primaryColor,
              textColor: Colors.white,
              borderRadius: 8.0.r,
              elevation: 0.0, label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPasswordTextField(
      String labelText, bool isPasswordVisible, VoidCallback toggleVisibility, {required TextEditingController controller}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[600],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0.r), // Rounded corners
          ),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: toggleVisibility,
          ),
        ),
        obscureText: !isPasswordVisible,
      ),
    );
  }
}
