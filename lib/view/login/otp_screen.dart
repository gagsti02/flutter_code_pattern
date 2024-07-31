import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecpay/view_model/login_viewmodel.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel = context.read<LoginViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                const Column(
                  children: [
                    Text(
                      "Verify Your Retailer",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Mobile Number",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "We've sent a 6-digit verification code to your",
                ),
                Text(
                  "mobile number ${loginViewModel.txtNum.text}",
                ),
                const SizedBox(
                  height: 30,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Colors.black,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: false,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) => loginViewModel
                      .verifyOTP(verificationCode), // end onSubmit
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Input the verification code within 5 minutes",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
