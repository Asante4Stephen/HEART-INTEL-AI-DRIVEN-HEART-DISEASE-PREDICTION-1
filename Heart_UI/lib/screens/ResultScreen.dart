import 'package:flutter/material.dart';
import 'package:insta_med_ui/components/bottom_navigation_widget.dart';
import 'package:insta_med_ui/theme/colors.dart';
import 'package:insta_med_ui/widgets/custom_button.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  final Map<String, dynamic> inputData;

  const ResultScreen({super.key, required this.result, required this.inputData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prediction Result:',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              result,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.accentColor,
                  ),
            ),
            const SizedBox(height: 32),
            Text(
              'Input Data:',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
            ),
            const SizedBox(height: 16),
            Column(
                children: [
                  _buildInputDataRow(context, 'Age', '${inputData['age']}'),
                  _buildInputDataRow(context, 'Gender', inputData['sex'] == 0 ? 'Male' :  'Female'),
                  _buildInputDataRow(context, 'Chest Pain Type', inputData['chestPainType'] == 0
                      ? 'Typical angina'
                      : inputData['chestPainType'] == 1
                          ? 'Atypical angina'
                          : inputData['chestPainType'] == 2
                              ? 'Non-anginal pain'
                              : 'Asymptomatic'),
                  _buildInputDataRow(context, 'Resting Blood Pressure', '${inputData['restingBloodPressure']} mmHg'),
                  _buildInputDataRow(context, 'Serum Cholesterol', '${inputData['serumCholesterol']} mg/dL'),
                  _buildInputDataRow(context, 'Fasting Blood Sugar Level', inputData['fastingBloodSugarLevel'] == 1 ? 'True' : 'False'),
                  _buildInputDataRow(context, 'Resting Electrocardio', inputData['restingElectrocardiographicResults'] == 0
                      ? 'Normal'
                      : inputData['restingElectrocardiographicResults'] == 1
                          ? 'ST-T wave abnormality'
                          : 'Showing probable'),
                  _buildInputDataRow(context, 'Maximum Heart Rate', '${inputData['maximumHeartRate']} bpm'),
                  _buildInputDataRow(context, 'Exercise Induced Angina', inputData['exerciseInducedAngina'] == 1 ? 'Yes' : 'No'),
                  _buildInputDataRow(context, 'ST Depression', '${inputData['stDepression']}'),
                  _buildInputDataRow(context, 'Slope', inputData['slope'] == 0
                      ? 'Upsloping'
                      : inputData['slope'] == 1
                          ? 'Flat'
                          : 'Downsloping'),
                  _buildInputDataRow(context, 'Number of Major Vessels', '${inputData['numberOfMajorVessels']}'),
                  _buildInputDataRow(context, 'Thallium Stress Test ', inputData['thalliumStressTestResults'] == 0
                      ? 'Normal'
                      : inputData['thalliumStressTestResults'] == 1
                          ? 'Fixed defect'
                          : inputData['thalliumStressTestResults'] == 2
                           ? 'Reversible defect'
                          
                          : 'Not described'),
                ],
            ), // Passing context
            const SizedBox(height: 32),
            Center(
              child: CustomButton(
                text: 'Go Back to Home',
                onPressed: () {
              
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomNavigationWidget()),
                    (route) => false,
                  );
                },
                color:Colors.blue,
                textColor: AppColors.whiteColor, label: '',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputDataRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textColor,
                ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.accentColor,
                ),
          ),
        ],
      ),
    );
  }
}
