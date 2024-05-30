import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infosec/helpers/color_changer.dart';
import 'package:infosec/helpers/constants.dart';
import 'package:infosec/helpers/secure_storage.dart';
import 'package:infosec/ui/pages/main/home_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginController = TextEditingController();
  final FocusNode loginFocusNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  String? errorText;
  bool isLoading = false;

  Future<void> login() async {
    if (isLoading) return;
    if (loginController.text.length < 6 || passwordController.text.length < 6) {
      errorText = "Login va parolni uzunligi\nkamida 6 ta harf bo'lishi shart";
      setState(() {});
      return;
    }
    setState(() {
      isLoading = true;
    });
    final result = await Dio().post(
      Constants.baseRegUrl + Constants.signUpSegment,
      options: Options(
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 400) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
      ),
      queryParameters: {
        'key': Constants.webKey,
      },
      data: {
        'email': loginController.text + '@gmail.com',
        'password': passwordController.text,
      },
    );
    if (result.data['idToken'] != null) {
      SecureStorage().writeSecureData('token', result.data['idToken']);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
      return;
    }
    final result2 = await Dio().post(
      Constants.baseRegUrl + Constants.verifySegment,
      options: Options(
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 400) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
      ),
      queryParameters: {
        'key': Constants.webKey,
      },
      data: {
        'email': loginController.text + '@gmail.com',
        'password': passwordController.text,
      },
    );
    if (result2.data['idToken'] != null) {
      SecureStorage().writeSecureData('token', result2.data['idToken']);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
      return;
    }

    setState(() {
      isLoading = false;
      errorText = "Login yoki parol xato!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                HexColor('#0D1B2A'),
                HexColor('#1A1A1A'),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/image/logo.png',
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'InfoSec',
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                child: TextFormField(
                  controller: loginController,
                  focusNode: loginFocusNode,
                  onChanged: (value) {
                    setState(() {
                      errorText = null;
                    });
                  },
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: null,
                    hintText: 'Login',
                    hintStyle: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                child: TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      errorText = null;
                    });
                  },
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: null,
                    hintText: 'Parol',
                    hintStyle: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Text(
                    errorText ?? '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: HexColor('#1E90FF').withOpacity(0.5),
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: isLoading
                      ? null
                      : () async {
                          await login();
                        },
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: isLoading
                        ? Center(
                            child: Container(
                                width: 26,
                                height: 26,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                )),
                          )
                        : Text(
                            'Kirish',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                height: 0,
                                fontSize: 18,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
