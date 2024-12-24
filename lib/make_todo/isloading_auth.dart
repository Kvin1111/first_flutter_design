import 'dart:developer';

import 'package:first_flutter_designer/make_todo/Login.dart';
import 'package:first_flutter_designer/make_todo/services/auth_local_service.dart';

import 'package:first_flutter_designer/todo_screen.dart';
import 'package:flutter/material.dart';

import 'todo_page.dart';

class IsloadingAuth extends StatefulWidget {
  const IsloadingAuth({super.key});

  @override
  State<IsloadingAuth> createState() => _IsloadingAuthState();
}

class _IsloadingAuthState extends State<IsloadingAuth> {
  final AuthLocalService _authLocalService = AuthLocalService();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    isloading();
  }
  var isLogin = false;
  void isloading() async{
    final token =await _authLocalService.getToken();
    setState(() {
      if(token != null){
        isLogin = true;
        
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return isLogin ? const TodoPage() : LoginPage();
  }
}