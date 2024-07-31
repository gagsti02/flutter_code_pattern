import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ecpay/view_model/login_viewmodel.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginModel = context.read<LoginViewModel>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(height: 100, "assets/images/eclogo.png"),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 16, 118, 202),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: TextField(
                      controller: loginModel.txtNum,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => loginModel.login(),
                    child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 16, 118, 202),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: const Center(
                            child: Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        ))),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
