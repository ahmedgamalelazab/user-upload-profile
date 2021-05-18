//this is the main two screen im going to program here

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upload_users_images/Presentation/Screens/auth/loginScreen.dart';
import 'package:upload_users_images/Presentation/Screens/profile/mainScreen.dart';
import 'package:upload_users_images/Presentation/Widgets/essentials/ApplicationAppbar.dart';
import 'package:upload_users_images/Presentation/Widgets/essentials/ApplicationFooter.dart';
import 'package:upload_users_images/Presentation/Widgets/fontsWidgets/fontWidgets.dart';
import 'package:upload_users_images/config/size.dart';
import 'package:upload_users_images/data/Models/authModel.dart';
import 'package:upload_users_images/logic/AuthBloc/auth_bloc.dart';

class SingupScreen extends StatelessWidget {
  static const String SGNUP_ROUTE = "/SignupScreen";
  SingupScreen({Key key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formBody = {
    "userName": "",
    "userEmail": "",
    "userPassword": "",
    "confirmPassword": ""
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F4C5C),
      appBar: applicationAppbar(context, "Sign Up"),
      body: Column(
        children: [
          Form(
            key: formKey,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: DeviceSizeConfigUtils
                              .getDeviceHeightWithoutNotificationBar(context) *
                          0.15,
                      width: DeviceSizeConfigUtils
                              .getDeviceHeightWithoutNotificationBar(context) *
                          0.15,
                      // color: Colors.red,
                      child: Stack(
                        children: [
                          Container(
                            height: DeviceSizeConfigUtils
                                    .getDeviceHeightWithoutNotificationBar(
                                        context) *
                                0.22,
                            width: DeviceSizeConfigUtils
                                    .getDeviceHeightWithoutNotificationBar(
                                        context) *
                                0.22,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/register.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width:
                          DeviceSizeConfigUtils.getDeviceWidth(context) * 0.85,
                      child: UserFormBuilderFields(
                        formBody: formBody,
                        uniqueSerial: "USERNAME",
                        labelText: "User Name",
                        helperText: "don't leave this filed empty",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: DeviceSizeConfigUtils
                                  .getDeviceHeightWithoutNotificationBar(
                                      context) *
                              0.015),
                      width:
                          DeviceSizeConfigUtils.getDeviceWidth(context) * 0.85,
                      child: UserFormBuilderFields(
                        formBody: formBody,
                        uniqueSerial: "USEREMAIL",
                        labelText: "User Email",
                        helperText: "EXAMPLE@EXAMPLE.COM",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: DeviceSizeConfigUtils
                                  .getDeviceHeightWithoutNotificationBar(
                                      context) *
                              0.015),
                      width:
                          DeviceSizeConfigUtils.getDeviceWidth(context) * 0.85,
                      child: UserFormBuilderFields(
                        formBody: formBody,
                        uniqueSerial: "USERPASSWORD",
                        labelText: "User Password",
                        helperText: "min Password Length 8 chars",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: DeviceSizeConfigUtils
                                  .getDeviceHeightWithoutNotificationBar(
                                      context) *
                              0.015),
                      width:
                          DeviceSizeConfigUtils.getDeviceWidth(context) * 0.85,
                      child: UserFormBuilderFields(
                        formBody: formBody,
                        uniqueSerial: "CONFIRMPASSWORD",
                        labelText: "Confirm Password",
                        helperText: "confirm your password",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: DeviceSizeConfigUtils
                                  .getDeviceHeightWithoutNotificationBar(
                                      context) *
                              0.015),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                DeviceSizeConfigUtils.getDeviceWidth(context),
                              ),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(
                            Size(
                                DeviceSizeConfigUtils.getDeviceWidth(context) *
                                    0.85,
                                DeviceSizeConfigUtils
                                        .getDeviceHeightWithoutNotificationBar(
                                            context) *
                                    0.075),
                          ),
                        ),
                        onPressed: () {
                          formKey.currentState.save();
                          if (!formKey.currentState.validate()) {
                            return;
                          }
                          formBody.forEach((key, value) {
                            print('$key : $value');
                          });
                          BlocProvider.of<AuthBloc>(context).add(
                            Register(
                              register: SignUp.fromJson(formBody),
                            ),
                          );
                          Navigator.of(context).pushReplacementNamed(
                              MainProfileScreen.PAGE_ROUTE);
                        },
                        child: Text(
                          "Submit",
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: DeviceSizeConfigUtils
                                    .getDeviceHeightWithoutNotificationBar(
                                        context) *
                                0.022,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: DeviceSizeConfigUtils
                                .getDeviceHeightWithoutNotificationBar(
                                    context) *
                            0.015,
                        bottom: DeviceSizeConfigUtils
                                .getDeviceHeightWithoutNotificationBar(
                                    context) *
                            0.015,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account",
                            style: GoogleFonts.openSans(
                              color: Colors.grey,
                              fontSize: DeviceSizeConfigUtils
                                      .getDeviceHeightWithoutNotificationBar(
                                          context) *
                                  0.018,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed(
                                  LoginScreen.LOGIN_ROUTE);
                            },
                            child: Text(
                              " sign in instead !",
                              style: GoogleFonts.openSans(
                                color: Theme.of(context).primaryColor,
                                fontSize: DeviceSizeConfigUtils
                                        .getDeviceHeightWithoutNotificationBar(
                                            context) *
                                    0.019,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          applicationFooter(context, "Profile app"),
        ],
      ),
    );
  }
}

class UserFormBuilderFields extends StatelessWidget {
  const UserFormBuilderFields({
    Key key,
    this.labelText,
    this.helperText,
    this.uniqueSerial,
    this.formBody,
  }) : super(key: key);

  final String uniqueSerial;
  final String labelText;
  final String helperText;
  final Map<String, dynamic> formBody;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:
          uniqueSerial == 'USERPASSWORD' || uniqueSerial == 'CONFIRMPASSWORD'
              ? true
              : false,
      validator: (value) {
        if (uniqueSerial == "USERNAME") {
          if (value.isEmpty) {
            return "Pleas enter your name ";
          }
          return null;
        } else if (uniqueSerial == "USEREMAIL") {
          bool isMatch = RegExp(
                  r'^(?=.*[\.])(?!.*(^[0-9]))(?!.*([0-9.])$)([a-zA-Z0-9]+@+[a-zA-Z0-9.]+)$')
              .hasMatch(value);
          if (!isMatch) {
            return "pleas enter a valid email address";
          } else if (value.isEmpty) {
            return "Pleas enter your email address";
          }
          return null;
        } else if (uniqueSerial == "USERPASSWORD") {
          if (value.isEmpty) {
            return "Pleas enter your password";
          } else if (value.length < 8) {
            return "min password length is 8 chars";
          }
          return null;
        } else if (uniqueSerial == 'CONFIRMPASSWORD') {
          if (value.isEmpty) {
            return "you can't continue without confirm password";
          } else if (value.toString() != formBody['userPassword'].toString()) {
            return "pleas match your password";
          }
          return null;
        }
        return null;
      },
      onSaved: (value) {
        if (uniqueSerial == "USERNAME") {
          formBody['userName'] = value;
        } else if (uniqueSerial == "USEREMAIL") {
          formBody['userEmail'] = value;
        } else if (uniqueSerial == "USERPASSWORD") {
          formBody['userPassword'] = value;
        } else if (uniqueSerial == 'CONFIRMPASSWORD') {
          formBody['confirmPassword'] = value;
        }
      },
      style: GoogleFonts.openSans(
        color: Colors.white,
        fontSize: DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                context) *
            0.022,
        fontWeight: FontWeight.w500,
      ),

      //!section of border Styling
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
        helperStyle: GoogleFonts.openSans(
          color: Colors.grey,
          fontSize: DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                  context) *
              0.019,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: GoogleFonts.openSans(
          color: Colors.white54,
          fontSize: DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                  context) *
              0.019,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.only(
          left: DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                  context) *
              0.060,
          right: DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                  context) *
              0.060,
        ),
        enabledBorder:
            userInputFormStyle(Theme.of(context).primaryColor, 2, context),
        focusedBorder:
            userInputFormStyle(Theme.of(context).primaryColor, 2, context),
        disabledBorder:
            userInputFormStyle(Theme.of(context).primaryColor, 2, context),
        errorBorder: userInputFormStyle(Colors.red, 1, context),
        focusedErrorBorder: userInputFormStyle(Colors.red, 2, context),
      ),
    );
  }
}

OutlineInputBorder userInputFormStyle(
  Color color,
  double width,
  BuildContext context,
) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: width,
    ),
    borderRadius: BorderRadius.circular(
        DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(context)),
  );
}
