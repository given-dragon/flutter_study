// ignore_for_file: prefer_const_constructors

import 'package:chat_app/config/palette.dart';
import 'package:flutter/material.dart';

const int ANIMATION_SPEED = 300;

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSingupScreen = true;
  final _formkey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0, //right,left모두 시작점으로 지정해서 화면을 꽉 채움
                left: 0,
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/red.jpg'), fit: BoxFit.fill),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 90, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Welcome',
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.white),
                              children: [
                                TextSpan(
                                  text: isSingupScreen
                                      ? ' to Yummy chat'
                                      : ' back',
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          isSingupScreen
                              ? 'Signup to continue'
                              : 'Signin to continue',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            AnimatedPositioned(
              duration: Duration(milliseconds: ANIMATION_SPEED),
              curve: Curves.easeIn,
              top: 180,
              child: AnimatedContainer(
                duration: Duration(milliseconds: ANIMATION_SPEED),
                curve: Curves.easeIn,
                height: isSingupScreen ? 280 : 250,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                          //로그인,회원가입 선택
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: Column(
                                //로그인
                                children: [
                                  Text('Login',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: !isSingupScreen
                                              ? Palette.activeColor
                                              : Palette.textColor1)),
                                  if (!isSingupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  isSingupScreen = false;
                                });
                              },
                            ),
                            GestureDetector(
                              child: Column(
                                //회원가입
                                children: [
                                  Text('SignUp',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isSingupScreen
                                              ? Palette.activeColor
                                              : Palette.textColor1)),
                                  if (isSingupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  isSingupScreen = true;
                                });
                              },
                            )
                          ]),
                      //if (isSingupScreen)
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                //user id
                                key: ValueKey('id'),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return 'Please enter at least 4 characters';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userName = value!;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Palette.textColor1,
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              if (isSingupScreen)
                                TextFormField(
                                  //user email
                                  key: ValueKey('email'),
                                  validator: (value) {
                                    if (value!.isEmpty || value.contains('@')) {
                                      return 'Please enter email address';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_rounded,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              if (isSingupScreen)
                                SizedBox(
                                  height: 8,
                                ),
                              TextFormField(
                                //user pw
                                key: ValueKey('pw'),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 6) {
                                    return 'Please enter at least 7 characters';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userPassword = value!;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.password_rounded,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Palette.textColor1,
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // if (!isSingupScreen) //Login form
                      //   Container(
                      //     margin: EdgeInsets.only(top: 10),
                      //     child: Form(
                      //       child: Column(
                      //         children: [
                      //           TextFormField(
                      //             //user id
                      //             decoration: InputDecoration(
                      //               prefixIcon: Icon(
                      //                 Icons.account_circle,
                      //                 color: Palette.iconColor,
                      //               ),
                      //               enabledBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color: Palette.textColor1,
                      //                 ),
                      //                 borderRadius: BorderRadius.all(
                      //                   Radius.circular(35),
                      //                 ),
                      //               ),
                      //               focusedBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color: Palette.textColor1,
                      //                 ),
                      //                 borderRadius: BorderRadius.all(
                      //                   Radius.circular(35),
                      //                 ),
                      //               ),
                      //               hintText: 'User name',
                      //               hintStyle: TextStyle(
                      //                 fontSize: 14,
                      //                 color: Palette.textColor1,
                      //               ),
                      //               contentPadding: EdgeInsets.all(10),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 8,
                      //           ),
                      //           TextFormField(
                      //             //user pw
                      //             decoration: InputDecoration(
                      //               prefixIcon: Icon(
                      //                 Icons.password_rounded,
                      //                 color: Palette.iconColor,
                      //               ),
                      //               enabledBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color: Palette.textColor1,
                      //                 ),
                      //                 borderRadius: BorderRadius.all(
                      //                   Radius.circular(35),
                      //                 ),
                      //               ),
                      //               focusedBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color: Palette.textColor1,
                      //                 ),
                      //                 borderRadius: BorderRadius.all(
                      //                   Radius.circular(35),
                      //                 ),
                      //               ),
                      //               hintText: 'Password',
                      //               hintStyle: TextStyle(
                      //                 fontSize: 14,
                      //                 color: Palette.textColor1,
                      //               ),
                      //               contentPadding: EdgeInsets.all(10),
                      //             ),
                      //             obscureText: true,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: ANIMATION_SPEED),
              curve: Curves.easeIn,
              top: isSingupScreen ? 430 : 390,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ]),
                  child: GestureDetector(
                    onTap: () {
                      _tryValidation();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              //google login
              top: isSingupScreen
                  ? MediaQuery.of(context).size.height - 165
                  : MediaQuery.of(context).size.height - 210,
              right: 0,
              left: 0,
              duration: Duration(milliseconds: ANIMATION_SPEED),
              curve: Curves.easeIn,
              child: Column(
                children: [
                  Text(isSingupScreen ? 'or Signup with' : 'or Signin with'),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                    ),
                    label: Text(
                      'Google',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Palette.googleColor,
                      minimumSize: Size(155, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
