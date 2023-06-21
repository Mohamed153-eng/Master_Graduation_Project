import 'package:flutter/material.dart';
import 'package:graduation/components/text/text_button.dart';
import 'package:graduation/components/text/text_form_field.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/models/model_provider.dart';
import 'package:graduation/screens/home_screen.dart';
import 'package:graduation/screens/sign_screens/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../drawer_screens/screens/user_information_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String loginScreenRoute = 'login screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ModelProvider>(
        builder: (context, classInstance, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: classInstance.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello ... !',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 10,
                                  color: defBlue,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Enter Your Account To Login',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 17.5,
                                  color: defBlue,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ReusableTextFormField(
                          controller: classInstance.emailLoginController,
                          text: 'Email',
                          prefix: Icon(Icons.email),
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                        ),
                        ReusableTextFormField(
                          controller: classInstance.passwordLoginController,
                          text: 'Password',
                          prefix: Icon(Icons.lock),
                          suffix: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove_red_eye),
                          ),
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 5),
                        ReusableTextButton(
                          color: defBlue,
                          onPressed: () async {
                            await classInstance.sendPostRequest(context);
                            Navigator.pushNamed(
                                context, HomeScreen.homeScreenRoute);
                          },
                          text: 'LOGIN',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "If you don't have an account, please ",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RegisterScreen.registerScreenRoute,
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
