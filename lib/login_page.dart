// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  void validate() {
    if (_formkey.currentState!.validate()) {
      debugPrint('Validate');
    } else {
      debugPrint('Not Validate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loginpage'),
      ),
      body: Container(
        color: Colors.deepOrange,
        alignment: Alignment.center,
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Please Enter valid email*'),
                        EmailValidator(
                            errorText: 'enter a valid email address'),
                      ]),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: MinLengthValidator(6,
                          errorText: 'Should be at least 6 digits'),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton(
                        onPressed: validate,
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
