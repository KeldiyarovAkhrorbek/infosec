import 'package:flutter/material.dart';
import 'package:infosec/helpers/secure_storage.dart';
import 'package:infosec/ui/pages/main/home_page.dart';
import 'package:infosec/ui/pages/registration/login_page.dart';

import '../../../helpers/color_changer.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash-page';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkToken();
  }

  Future<void> checkToken() async {
    var token = await SecureStorage().getToken();
    if (token == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
    }
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
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
