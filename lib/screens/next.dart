import 'package:flutter/material.dart';

import 'splash.dart';

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
