// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;


  changePage(int i){
    _currentPage = i;
    notifyListeners();
  }

  
}