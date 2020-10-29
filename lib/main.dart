import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Screen Transition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        '/': (_) => new Splash(),
        '/login': (_) => new Login(),
        '/home': (_) => new Home(),
        '/next': (_) => new Next(),
      },
    );
  }
}

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

/* ============================= */
/* ログイン画面 */
/* ============================= */
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Login'),
      ),
      body: new Center(
        child: new Form(
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24),
                new TextFormField(
                  decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'User ID'),
                ),
                const SizedBox(
                  height: 24,
                ),
                new TextFormField(
                  maxLength: 8,
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                new Center(
                  child: new RaisedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* ============================= */
/* ホーム画面 */
/* ============================= */
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Home'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: const Text('Launch Next Screen'),
          onPressed: () {
            Navigator.of(context).pushNamed('/next', arguments: '/home');
          },
        ),
      ),
    );
  }
}

/* ============================= */
/* その他の画面 */
/* ============================= */
class Next extends StatefulWidget {
  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Next'),
      ),
      body: new Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 24,
              ),
              new Text(
                  'Launch by ${ModalRoute.of(context).settings.arguments}'),
              const SizedBox(
                height: 24,
              ),
              new RaisedButton(
                child: const Text('Launch Next Screen'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/next', arguments: '/next');
                },
              ),
              const SizedBox(
                height: 24,
              ),
              new RaisedButton(
                child: const Text('Back to Home'),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
                },
              ),
              const SizedBox(
                height: 24,
              ),
              new RaisedButton(
                child: const Text('Logout'),
                onPressed: () {
                  showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return new AlertDialog(
                        content: const Text('Do you want logout?'),
                        actions: <Widget>[
                          new FlatButton(
                            child: const Text('No'),
                            onPressed: () {
                              // call then false
                              Navigator.of(context).pop(false);
                            },
                          ),
                          new FlatButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              // call then true
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    },
                  ).then<void>((isClose) {
                    if (!isClose) {
                      return;
                    }

                    Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        new MaterialPageRoute<dynamic>(
                            builder: (context) => new Splash()),
                        (_) => false);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
