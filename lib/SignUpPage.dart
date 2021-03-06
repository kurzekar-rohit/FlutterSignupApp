import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();
 static String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  bool _autovalidate = false;
  String name, email, mobile, collegename;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Image(
                  image: AssetImage("images/logo.png"),
                  width: 100.0,
                  height: 100.0,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    onSaved: (input) => name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty || !input.contains("@")) {
                        return 'Enter valid mail ID';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    onSaved: (input) => email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextFormField(
                    //this hides the text being edited
                    obscureText: true,
                    
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter mobile';
                      } else if(!regExp.hasMatch(value)){
                        return 'Please enter valid mobile number';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                    ),
                    onSaved: (input) => mobile = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter college name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'College name',
                    ),
                    onSaved: (input) => collegename = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  child: RaisedButton(
                    onPressed: _sendToNextScreen,
                    color: Colors.redAccent,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(00.0, 10.0, 00.0, 10.0)),
                // ButtonTheme(
                //   height: 40.0,
                //   minWidth: 200.0,
                //   child: RaisedButton(
                //     onPressed: _sendToNextScreen,
                //     color: Colors.redAccent,
                //     child: Text(
                //       'Save',
                //       style: TextStyle(
                //         color: Colors.white,
                //       ),
                //     ),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendToNextScreen() {
    if (_key.currentState.validate()) {
      //saves to global key
      _key.currentState.save();
      //send to next screen
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    name: name,
                    mobile: mobile,
                    email: email,
                    collegename: collegename,
                  )));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
