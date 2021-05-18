import 'package:flutter/material.dart';
import 'package:upload_users_images/Presentation/Screens/auth/loginScreen.dart';
import 'package:upload_users_images/Presentation/Screens/auth/signupScreen.dart';
import 'package:upload_users_images/Presentation/Screens/profile/mainScreen.dart';
import 'package:upload_users_images/Presentation/Screens/profile/userProfileScreen.dart';

class ApplicationRoutes {
  static routes() {
    return {
      SingupScreen.SGNUP_ROUTE: (context) => SingupScreen(),
      LoginScreen.LOGIN_ROUTE: (context) => LoginScreen(),
      MainProfileScreen.PAGE_ROUTE: (context) => MainProfileScreen(),
      UserProfileScreen.PAGE_ROUTE: (context) => UserProfileScreen(),
    };
  }

  static initialRoute() {
    return SingupScreen.SGNUP_ROUTE;
  }
}
