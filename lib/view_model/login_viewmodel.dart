import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ecpay/model/response_model.dart';
import 'package:flutter_ecpay/repo/response.dart';
import 'package:flutter_ecpay/routes/router.gr.dart';
import 'package:flutter_ecpay/services/login_service.dart';
import 'package:flutter_ecpay/utilities/getit.dart';

class LoginViewModel extends ChangeNotifier {
  late ResponseModel responseModel;

  TextEditingController txtNum = TextEditingController();

  login() async {
    EasyLoading.show();
    var res = await LoginService.loginNumber(txtNum.text);
    if (res is Success) {
      responseModel = res.response as ResponseModel;
      EasyLoading.showSuccess(responseModel.msg);
      sendOTP();
      getroute.navigate(const OtpRoute());
    }
  }

  sendOTP() async {
    var res = await LoginService.sendOtp(txtNum.text);
    if (res is Success) {
      responseModel = res.response as ResponseModel;
      EasyLoading.showSuccess(responseModel.msg);
    }
  }

  verifyOTP(String code) async {
    var res = await LoginService.verifyOtp(txtNum.text, code);
    if (res is Success) {
      responseModel = res.response as ResponseModel;
      if (!responseModel.code.contains("100015")) {
        EasyLoading.showSuccess(responseModel.msg);
        getroute.replaceAll([const HomeRoute()]);
      } else {
        EasyLoading.showError(responseModel.msg);
      }
    }
  }
}
