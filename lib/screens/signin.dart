import 'package:flutter/material.dart';
import 'package:agried/screens.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  static const String route = '/signin';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String _email;
  String _password;

  bool _passwordVisibility = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisibility = !_passwordVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    TextFormField emailTextFormField = TextFormField(
      autofocus: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Emaill cannot be empty!';
        } else if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'Invalid Email address!';
        }

        return null;
      },
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email address',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
    );

    TextFormField passwordTextFormField = TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Password cannot be empty!';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters!';
        }

        return null;
      },
      controller: passwordController,
      obscureText: !_passwordVisibility,
      decoration: InputDecoration(
          labelText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: _togglePasswordVisibility,
              icon: _passwordVisibility
                  ? Icon(Icons.visibility_rounded)
                  : Icon(Icons.visibility_off_rounded))),
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => node.unfocus(),
    );

    MaterialButton signInButton = MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      height: 50.0,
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        setState(() {
          _email = emailController.text;
          _password = passwordController.text;
        });

        // if (_formKey.currentState.validate()) {
        //   if (_email != 'siti@agried.com') {
        //     print('Wrong email or password!');
        //   } else if (_password != 'agried123') {
        //     print('Wrong email or password!');
        //   } else {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => LandingScreen()));
        //   }
        // }

        Navigator.pushNamed(
          context,
          LandingScreen.route,
        );
      },
      child: Text('Sign In'),
    );

    return Scaffold(
        body: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              emailTextFormField,
              SizedBox(height: 25.0),
              passwordTextFormField,
              SizedBox(
                height: 35.0,
              ),
              signInButton
            ],
          ),
        ),
      ),
    ));
  }
}
