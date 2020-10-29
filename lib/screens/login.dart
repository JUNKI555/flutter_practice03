import 'package:flutter/material.dart';

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
