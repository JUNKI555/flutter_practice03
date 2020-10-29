import 'package:flutter/material.dart';

/* ============================= */
/* スプラッシュ画面 */
/* ============================= */
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void handleTimeout() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  void initState() {
    super.initState();

    new Future<dynamic>.delayed(const Duration(seconds: 3))
        .then((dynamic value) => handleTimeout());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
