import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wedding/models/mobileOtp.dart'; // Adjust this import as needed
import 'package:wedding/screens/SuccessScreen.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String verificationId;

  const OTPVerificationScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();
  bool isVerifying = false;
  final Authentication auth = Authentication();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/dadfs3.png', height: 200),
            SizedBox(height: 24),
            Text(
              'Almost there',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Please enter the 6-digit code sent to your phone',
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Pinput(
              length: 6,
              animationCurve: Curves.easeInOut,
              controller: otpController,
              autofocus: true,
              animationDuration: Duration(milliseconds: 300),
              autofillHints: [AutofillHints.oneTimeCode],
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: theme.textTheme.titleLarge?.copyWith(color: theme.primaryColor),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: theme.textTheme.titleLarge?.copyWith(color: theme.primaryColor),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: theme.primaryColor),
                ),
              ),
            ),
            SizedBox(height: 24),
            isVerifying
                ? CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isVerifying = true;
                        });
    
                        bool verified = false;
                        try {
                          verified = await auth.signInWithOtp(widget.verificationId, otpController.text);
                        } catch (e) {
                          print('Error verifying OTP: $e');
                        }
    
                        setState(() {
                          isVerifying = false;
                        });
    
                        if (verified) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuccessScreen(),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text('Invalid OTP. Please try again.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close dialog
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: Text('Verify OTP', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Logic to resend code
              },
              child: Text(
                "Didn't receive any code? Request new code in 00:30s",
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
