import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melcosh_cafe/API/APIUser.dart';
import 'package:melcosh_cafe/Model/data_sharedpreferences.dart';
import 'package:melcosh_cafe/Page/homepage.dart';
import 'package:melcosh_cafe/Page/registerpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    'assets/logo.png',
                  ),
                ),
                const Text(
                  "Hi There",
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail),
                    labelText: "Email",
                    prefixStyle: const TextStyle(
                        color: Color(0xFF000080), fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[900]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.vpn_key),
                    labelText: "Password",
                    prefixStyle: const TextStyle(
                        color: Color(0xFF000080), fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[900]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Center(
                            child: Text("Reset Password Ke '123'?")),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: _email,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
                                labelText: "Email",
                                prefixStyle: const TextStyle(
                                    color: Color(0xFF000080),
                                    fontWeight: FontWeight.w600),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue[900]),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: _phone,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.phone),
                                labelText: "No Telefon",
                                prefixStyle: const TextStyle(
                                    color: Color(0xFF000080),
                                    fontWeight: FontWeight.w600),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue[900]),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              if (_email.text == "" || _phone.text == "") {
                                Get.snackbar("Maaf", "Harap Lengkapi data Anda",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red);
                              } else {
                                APIUser.resetPassword(
                                        context, _email.text, _phone.text)
                                    .then((value) {
                                  Get.back();
                                  Get.snackbar("Informasi", value[0].apimessage,
                                      backgroundColor: Colors.yellow);
                                });
                              }
                            },
                            child: const Text("RESET"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot Your Password",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_email.text == "" || _password.text == "") {
                            Get.snackbar("Information", "Lengkapi Data Anda",
                                backgroundColor: Colors.yellow);
                          } else {
                            APIUser.login(context, _email.text, _password.text)
                                .then((value) {
                              Get.snackbar("Information", value[0].apimessage,
                                  backgroundColor: Colors.yellow);
                              if (value[0].status == "success") {
                                DataSharedPreferences()
                                    .saveString("email", _email.text);
                                DataSharedPreferences()
                                    .saveString("nama", value[0].name);
                                Get.offAll(() => const HomePage());
                              }
                            });
                          }
                        },
                        child: const Text("LOGIN"),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const RegisterPage());
                      },
                      child: const Text(
                        "Don't Have an account yet? Register",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
