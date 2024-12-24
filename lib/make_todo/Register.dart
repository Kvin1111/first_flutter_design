

import 'package:first_flutter_designer/core/constant.dart';
import 'package:first_flutter_designer/make_todo/Login.dart';
import 'package:first_flutter_designer/make_todo/utils/snakbar.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final _txtUsername = TextEditingController();
  final _txtEmail = TextEditingController();
  final _txtPassword = TextEditingController();
  Future<void> _register()async{
    
    try {
      var url =Uri.parse('$beseUrl/api/users/register');
      var response = await http.post(url, body: {
        'username': _txtUsername.text,
        'password': _txtPassword.text,
        'email': _txtEmail.text,
      });
      if(response.statusCode == 201){
        SnackbarUtils.showSnackbar(context, 'Register success');
      }
    } catch (e) {
      SnackbarUtils.showSnackbar(context, 'Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
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
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Login to your existing account of Q Allure!',
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
                  child: TextField(
                    controller: _txtUsername,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _txtEmail,
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _txtPassword,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.security),
                      hintText: 'Passwork',
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.065,
                  child: TextButton(
                      onPressed: () async{
                       await _register();
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          Colors.blue,
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do you have an Account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text('Login'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
