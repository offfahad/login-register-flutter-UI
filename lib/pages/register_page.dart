// ignore_for_file: sort_child_properties_last, unnecessary_const, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  late String _username, _email, _password;
  bool _obscureText = true;
  Widget _showTitle() {
    return Text('Register', style: Theme.of(context).textTheme.headline1);
  }

  Widget _showUsernameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _username = val!,
        validator: (val) =>
            val!.length < 6 ? 'Username minimum length must be 6.' : null,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Min length must be 6.',
            icon: Icon(Icons.face, color: Colors.grey)),
      ),
    );
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
            hintText: 'Enter a valid email address.',
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
            val!.length < 6 ? 'Password minimum length must be 6.' : null,
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
            hintText: 'Min length must be 6.',
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
            color: Theme.of(context).primaryColor,
            onPressed: _submit),
        FlatButton(
          child: const Text('Existing user? Login'),
          onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
        )
      ]),
    );
  }

  void _submit() {
    final form = _formkey.currentState;
    if (form!.validate()) {
      form.save();
      print('Username: $_username, Email: $_email, Password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
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
                      _showUsernameInput(),
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
