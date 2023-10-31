import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final TextEditingController pwd_controller = TextEditingController();
  MaterialColor emailColor = Colors.cyan;
  MaterialColor passwordColor = Colors.cyan;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: TextFormField(
              // Email
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 20),
                  hintText: 'Email',
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: emailColor, width: 2)),
                  border: UnderlineInputBorder(borderSide: BorderSide(color: emailColor, width: 1)),
                  disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: emailColor, width: 1)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  emailColor = Colors.cyan;
                  return 'Please enter your email';
                }
                if (!EmailValidator.validate(value)) {
                  emailColor = Colors.cyan;
                  return 'Please enter a valid email';
                }
                emailColor = Colors.red;
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: TextFormField(
              // Email
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 20),
                hintText: 'Password',
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: emailColor, width: 2)),
                border: UnderlineInputBorder(borderSide: BorderSide(color: emailColor, width: 1)),
                disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: emailColor, width: 1)),
              ),
              onChanged: (value) {
                this.
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length <= 5) {
                  return "Please enter a valid password (minimum 6 characters)";
                }
                return null;
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
          ),
        ],
      ),
    );
  }
}