import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SignPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void validate() {
    if (_formkey.currentState!.validate()) {
      debugPrint('Validate');
    } else {
      debugPrint('Not Validate');
    }
  }

  String _dateOfName = "";
  String _mobileNumber = "";
  bool Dob = true;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signpage.'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formkey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                  validator:
                      ValidationBuilder().minLength(5).maxLength(20).build(),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                  validator:
                      ValidationBuilder().minLength(5).maxLength(20).build(),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                  validator:
                      ValidationBuilder().minLength(5).maxLength(20).build(),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: Dob ? false : true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "dd-MM-yyyy",
                    labelText: 'Date of Birthday',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          Dob = !Dob;
                        });
                      },
                      icon: Icon(
                        Dob ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please fill the dateOfbirthday.';
                    }
                    if (int.parse(value) < 18) {
                      return 'you are not 18+';
                    }
                    return null;
                  },
                  onChanged: (value) => _dateOfName = value,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: _isObscure ? false : true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Mobile No.',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter 10 digits mobileNo.';
                    }
                    if (value.trim().length < 10) {
                      return 'mobileNo 10 numbers in length';
                    }
                    return null;
                  },
                  onChanged: (value) => _mobileNumber = value,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: validate,
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
