import 'dart:convert';
import 'dart:developer';
import 'package:first_flutter_designer/core/constant.dart';
import 'package:first_flutter_designer/make_todo/services/auth_local_service.dart';
import 'package:first_flutter_designer/make_todo/todo_page.dart';
import 'package:first_flutter_designer/make_todo/utils/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _loginpageState();
}

class _loginpageState extends State<LoginPage> {
  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  final AuthLocalService _authLocalService = AuthLocalService();
  bool showIconsPassword = true;
  Future<bool> _loginpase() async {
    try {
      var url = Uri.parse('$beseUrl/api/users/login');
      var response = await http.post(url, body: {
        'password': passwordController.text,
        'email': emailController.text,

      });
      if (response.statusCode == 200) {
        SnackbarUtils.showSnackbar(context, 'Login success');
        final data = jsonDecode(response.body);
        _authLocalService.saveToken(data['token']);
        log('Token: ${data['token']}');
        return true;
      }else {
        SnackbarUtils.showSnackbar(context, 'Login failed');
        return false;
      }
    } catch (e) {
      SnackbarUtils.showSnackbar(context, 'Error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: Image.network(
                        'https://ecurater.com/wp-content/uploads/2020/10/login1.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome Our App!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Register to your existing account of Q Allure!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 103, 102, 102),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email ';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Email',
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: showIconsPassword,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Password',
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showIconsPassword = !showIconsPassword;
                                });
                              },
                              icon: const Icon(Icons.remove_red_eye))),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: TextButton(
                          onPressed: () async{
                            if (_formkey.currentState!.validate()) {
                              
                             var islogin =   await _loginpase();
                            if(islogin){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => TodoPage()));
                            }
                               
                              
                            }
                            else{
                              print('Error');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 37, 73, 214)),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'OR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(
                                  Color.fromARGB(255, 37, 73, 214)),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
