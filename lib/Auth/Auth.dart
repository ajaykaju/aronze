import 'package:aronze/Auth/Verification.dart';
import 'package:aronze/Transitions/SlideTransitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AuthDecider extends StatefulWidget {
  const AuthDecider({Key? key}) : super(key: key);

  @override
  _AuthDeciderState createState() => _AuthDeciderState();
}

class _AuthDeciderState extends State<AuthDecider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ChangeNotifierProvider(
              create: (context) => AuthState(),
              builder: (context, child) => Consumer(
                builder: (context, AuthState auth, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(
                              "assets/images/aronze_logo_tb.jpg"),
                          width: 60,
                        ),
                        Text(
                          "Aronze",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 55, right: 55, bottom: 10),
                      child: Image(
                        image: AssetImage("assets/images/signup_image.png"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Builder(
                        builder: (context) {
                          if (auth.cState == AuthStateType.signup) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blueGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Full Name",
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                    ),
                                    keyboardType: TextInputType.name,
                                    cursorColor: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Mobile Number",
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                    ),
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.black,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blueGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Enter Password",
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor: Colors.black,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blueGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Confirm Password",
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.only(left: 10, right: 10),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor: Colors.black,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    Text("* By signing up you accept our"),
                                    Text(
                                      " Terms of Use",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).push(SlideFromBottomRoute(page: Verification()));
                                        },
                                        height: 65,
                                        elevation: 0.0,
                                        splashColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                        ),
                                        color: Color.fromRGBO(236, 152, 26, 1),
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    Text("Already have an account?"),
                                    GestureDetector(
                                      onTap: (){
                                        context
                                            .read<AuthState>()
                                            .stateChanger(AuthStateType.login);
                                      },
                                      child: Text(
                                        " Login",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }
                          else return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Mobile Number",
                                    errorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.only(left: 10, right: 10),
                                  ),
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.black,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    errorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.only(left: 10, right: 10),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor: Colors.black,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: MaterialButton(
                                      onPressed: () {
                                        print("d");
                                      },
                                      height: 65,
                                      elevation: 0.0,
                                      splashColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      color: Colors.black,
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  Text("Don't have an account?"),
                                  GestureDetector(
                                    onTap: (){
                                      context
                                          .read<AuthState>()
                                          .stateChanger(AuthStateType.signup);
                                    },
                                    child: Text(
                                      " SignUp",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    )
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


class AuthState extends ChangeNotifier {
  AuthStateType cState = AuthStateType.login;
  void stateChanger(AuthStateType _myState) {
    cState = _myState;
    notifyListeners();
  }
}

enum AuthStateType { signup, login }
