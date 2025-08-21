//final otp_screen.dart
import 'package:flutter/material.dart';
import 'welcome_screen.dart'; 

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({Key? key, required this.email}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  void _verifyOtp() {
    String enteredOtp = _controllers.map((c) => c.text).join();

    if (enteredOtp.isEmpty || enteredOtp != "229166") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter 229166")),
      );
      return;
    }

    // ✅ Navigate to WelcomeScreen after correct OTP
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }

  void _resendOtp() {
    // ✅ Resend OTP uses demo OTP
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("OTP resent. Use demo OTP: 229166")),
    );
    // Clear the text fields
    for (var controller in _controllers) {
      controller.clear();
    }
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Enter the OTP sent to ${widget.email}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 10),

                // ✅ Info text instead of snackbar
                const Text(
                  "This is a mock API. Use demo OTP: 229166",
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // OTP Boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 45,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          }
                          if (value.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 30),

                // Verify Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _verifyOtp,
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Resend OTP
                TextButton(
                  onPressed: _resendOtp,
                  child: const Text(
                    "Resend OTP",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
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




