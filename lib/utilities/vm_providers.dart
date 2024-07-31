import 'package:flutter_ecpay/view_model/home_viewmodel.dart';
import 'package:flutter_ecpay/view_model/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ChangeNotifierProvider(create: (_) => HomeViewModel()),
];