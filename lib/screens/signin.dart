import 'package:flutter/material.dart';
import 'package:agried/screens.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  static const String route = '/signin';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _email;
  String? _password;

  bool _passwordVisibility = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisibility = !_passwordVisibility;
    });
  }

  void _toggleKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void _handleSignIn() {
    setState(() {
      _email = emailController.text;
      _password = passwordController.text;
    });

    if (_formKey.currentState!.validate()) {
      if (_email != 'siti@agried.com') {
        print('Wrong email or password!');
      } else if (_password != 'agried123') {
        print('Wrong email or password!');
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LandingScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode node = FocusScope.of(context);

    TextFormField emailTextFormField = TextFormField(
      autofocus: true,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
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
        hintText: 'Email address',
        hintStyle: TextStyle(
          fontSize: 16.0,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        contentPadding: EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      onEditingComplete: () => node.nextFocus(),
    );

    TextFormField passwordTextFormField = TextFormField(
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty!';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters!';
        }

        return null;
      },
      controller: passwordController,
      obscureText: !_passwordVisibility,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(
          fontSize: 16.0,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        contentPadding: EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
        suffixIcon: IconButton(
          onPressed: _togglePasswordVisibility,
          padding: EdgeInsets.only(right: 20.0),
          icon: Icon(
            _passwordVisibility
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
            color: Colors.grey,
          ),
        ),
      ),
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => node.unfocus(),
    );

    ElevatedButton signInButton = ElevatedButton(
      onPressed: _handleSignIn,
      child: Text(
        'Sign In'.toUpperCase(),
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    MaterialBanner infoBanner = MaterialBanner(
      content: RichText(
        text: TextSpan(
          text: 'You can use ',
          style: TextStyle(
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'siti@agried.com ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'and password ',
            ),
            TextSpan(
              text: 'agried123',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      leading: Icon(
        Icons.info_outline_rounded,
        color: Colors.blue,
      ),
      padding: EdgeInsets.fromLTRB(16.0, 12.0, 12, 12.0),
      backgroundColor: Colors.blue[50],
      actions: <Widget>[SizedBox()],
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _toggleKeyboard(context);
          },
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  emailTextFormField,
                  SizedBox(
                    height: 20.0,
                  ),
                  passwordTextFormField,
                  SizedBox(
                    height: 20.0,
                  ),
                  infoBanner,
                  SizedBox(
                    height: 25.0,
                  ),
                  signInButton
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
