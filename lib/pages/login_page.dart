// ignore_for_file: sort_child_properties_last, unnecessary_const, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  late String _email, _password;
  bool _obscureText = true;

  Widget _showTitle() {
    return Text('Login', style: Theme.of(context).textTheme.headline1);
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _email = val!,
        validator: (val) => !val!.contains('@') ? 'Invalid Email.' : null,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
            //hintText: 'Enter a valid email address.',
            icon: Icon(Icons.mail, color: Colors.grey)),
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _password = val!,
        validator: (val) =>
            val!.length < 6 ? 'Password minimum lenght must be 6.' : null,
        obscureText: _obscureText,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() => _obscureText = !_obscureText);
              },
              child:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            ),
            border: OutlineInputBorder(),
            labelText: 'Password',
            //hintText: 'Minimum lenght must be 6.',
            icon: Icon(Icons.lock, color: Colors.grey)),
      ),
    );
  }

  Widget _showFormActions() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(children: [
        RaisedButton(
            child: Text(
              'Submit',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.black),
            ),
            elevation: 8.0,
            shape: const RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            color: Theme.of(context).accentColor,
            onPressed: _submit),
        FlatButton(
          child: const Text('New user? Register'),
          onPressed: () => Navigator.pushReplacementNamed(context, '/register'),
        )
      ]),
    );
  }

  void _submit() {
    final form = _formkey.currentState;
    if (form!.validate()) {
      form.save();
      print('Email: $_email, Password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      _showTitle(),
                      _showEmailInput(),
                      _showPasswordInput(),
                      _showFormActions(),
                    ],
                  )),
            ),
          )),
    );
  }
}
