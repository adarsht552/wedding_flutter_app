import 'package:flutter/material.dart';
import 'package:wedding/models/mobile_otp.dart'; // Replace with actual import path
import 'package:wedding/screens/otp_verification_screen.dart'; // Replace with actual import path

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Authentication _auth = Authentication(); // Replace with your Authentication class
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = 'IND +91';
  String? _verificationId;
  bool _isSendingCode = false;
  bool _isButtonEnabled = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      _isButtonEnabled = isValid;
    });
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }
    final phoneNumber = _selectedCountryCode.split(' ')[1] + value;
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number should contain only digits';
    }
    if (phoneNumber.length < 10) {
      return 'Phone number should be at least 10 digits';
    }
    return null;
  }

  Future<void> _sendOtp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isSendingCode = true;
    });

    try {
      String phoneNumber = _selectedCountryCode.split(' ')[1] + _phoneController.text;
      String verificationId = await _auth.sendOtp(phoneNumber);
      setState(() {
        _verificationId = verificationId;
        _isSendingCode = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPVerificationScreen(
            verificationId: verificationId,
          ),
        ),
      );
    } catch (e) {
      setState(() {
        _isSendingCode = false;
      });
      // Handle error appropriately
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send OTP. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 238, 233),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/dadfs4.png'), // Replace with actual image path
                SizedBox(height: 16),
                Text(
                  'What is your phone number?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    DropdownButton<String>(
                      value: _selectedCountryCode,
                      items: <String>['IND +91', 'USA +1', 'UK +44'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCountryCode = newValue!;
                          _validateForm(); // Revalidate when country code changes
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          border: OutlineInputBorder(),
                        ),
                        validator: _validatePhoneNumber,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'By continuing, you agree to Mangalyam\'s Terms of Service and confirm that you have read Mangalyam\'s Privacy Policy. If you sign up SMS, SMS fees may apply.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSendingCode || !_isButtonEnabled ? null : _sendOtp,
                    child: _isSendingCode
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 3,
                            ),
                          )
                        : Text('Send code'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
