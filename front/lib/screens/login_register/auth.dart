import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
// import '../methods/toast.dart';

class AuthPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AuthPage({Key? key}) : super(key: key);
  static const routeName = '/auth';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late StreamSubscription<User?> _subscriptionAuth;
  String _message = 'loading...';
  late User _firebaseUser;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _streamOpen();
  }

  @override
  void dispose() {
    _subscriptionAuth.cancel();
    super.dispose();
  }

  _streamOpen() {
    _subscriptionAuth = FirebaseAuth.instance.authStateChanges().listen((fu) {
      if (fu == null) {
        Navigator.pushReplacementNamed(context, '/signin');
        return;
      }
      setState(() => _firebaseUser = fu);
      if (!fu.emailVerified) {
        setState(() => _message = 'Email is not authenticated.');
        return;
      }
      // Navigator.pushReplacementNamed(context, '/home', arguments: {'fu': fu, 'dance': 'withme'});
      Navigator.pushReplacementNamed(context, '/home', arguments: fu);
    });
  }

  Widget _buildReloadButton() {
    return RaisedButton(
      child: Text('Email Confirmed'),
      onPressed: () async {
        final fu = await FirebaseAuth.instance.currentUser!;
        await fu.reload();
        if (!fu.emailVerified) {
          // toastError(
          //     _scaffoldKey, 'Email is not authenticated. please try again');
          return;
        }
        Navigator.pushReplacementNamed(context, '/home', arguments: fu);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Account check')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_message),
              SizedBox(
                height: 10,
              ),
              _firebaseUser == null
                  ? CircularProgressIndicator()
                  : _buildReloadButton()
            ],
          ),
        ),
      ),
    );
  }
}
