import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:upload_users_images/Presentation/Screens/profile/userProfileScreen.dart';
import 'package:upload_users_images/data/Models/profileModel.dart';
import 'package:upload_users_images/data/dataProviders/profileApi.dart';
import 'package:upload_users_images/logic/ProfileBloc/profile_bloc.dart';

import '../../../config/size.dart';
import '../../../logic/AuthBloc/auth_bloc.dart';
import '../../../providers/imagePicker.dart';
import '../../Widgets/essentials/ApplicationAppbar.dart';
import '../../Widgets/essentials/ApplicationFooter.dart';
import '../auth/loginScreen.dart';

class MainProfileScreen extends StatelessWidget {
  static const String PAGE_ROUTE = "/mainProfileScreen";
  const MainProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoadedSignupAuth) {
        return OnGlobalSigninORSignupProcessFinished(
          appBarTitle: state.loadedSignup.userName,
          stateTitle: state.loadedSignup.userEmail,
          token: state.loadedSignup.token,
        );
      } else if (state is LoadedSigninAuth) {
        return OnGlobalSigninORSignupProcessFinished(
          appBarTitle: state.loadedSignIn.userName,
          stateTitle: state.loadedSignIn.userEmail,
          token: state.loadedSignIn.token,
        );
      } else if (state is LoadedGlobalStateForSigninORSignUpEndedWithError) {
        return OnLoadedGlobalSignInORSignupErrorScreen(
          errorMessage: state.loadedSignup.errorMessage,
        );
      }
      return OnLoadingScreenWidget();
    }, listener: (context, state) {
      if (state is RedirectingFromErrorScreenToLoginScreen) {
        Navigator.of(context).pushReplacementNamed(LoginScreen.LOGIN_ROUTE);
      }
    });
  }
}

class OnLoadedGlobalSignInORSignupErrorScreen extends StatelessWidget {
  const OnLoadedGlobalSignInORSignupErrorScreen({Key key, this.errorMessage})
      : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F4C5C),
      appBar: applicationAppbar(context, "Sign Up"),
      body: Container(
        width: DeviceSizeConfigUtils.getDeviceWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:
                  DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                          context) *
                      0.10,
              width:
                  DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                          context) *
                      0.10,
              child: Image.asset("assets/images/registerFail.png"),
            ),
            SizedBox(
              height:
                  DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                          context) *
                      0.090,
            ),
            Container(
              child: Text(
                errorMessage,
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: DeviceSizeConfigUtils
                          .getDeviceHeightWithoutNotificationBar(context) *
                      0.020,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height:
                  DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                          context) *
                      0.050,
            ),
            Container(
              height:
                  DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                          context) *
                      0.050,
              width:
                  DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                          context) *
                      0.050,
              child: LoadingIndicator(
                indicatorType: Indicator.lineSpinFadeLoader,
                color: Color(0xffFB8B24),
              ),
            ),
            SizedBox(
              height:
                  DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                          context) *
                      0.050,
            ),
            Container(
              child: Text(
                "redirecting you to Login screen .. ",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: DeviceSizeConfigUtils
                          .getDeviceHeightWithoutNotificationBar(context) *
                      0.015,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnGlobalSigninORSignupProcessFinished extends StatelessWidget {
  OnGlobalSigninORSignupProcessFinished(
      {Key key, this.appBarTitle, this.stateTitle, this.token})
      : super(key: key);
  final String appBarTitle;
  final String stateTitle;
  final String token;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F4C5C),
      appBar: applicationAppbar(context, appBarTitle),
      body: Container(
        width: DeviceSizeConfigUtils.getDeviceWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Form(
                key: formKey,
                child: Container(
                  alignment: Alignment.center,
                  child: Consumer<ImagePickerProvider>(
                    builder: (context, data, child) => SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: DeviceSizeConfigUtils
                                    .getDeviceHeightWithoutNotificationBar(
                                        context) *
                                0.045,
                          ),
                          Container(
                            width:
                                DeviceSizeConfigUtils.getDeviceWidth(context) *
                                    0.8,
                            child: TextFormField(
                              onSaved: (value) {
                                data.setImageTitle(value);
                              },
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: DeviceSizeConfigUtils
                                        .getDeviceHeightWithoutNotificationBar(
                                            context) *
                                    0.022,
                                fontWeight: FontWeight.w500,
                              ),
                              //!section of border Styling
                              decoration: InputDecoration(
                                labelText: "image Title",
                                helperText: "enter photo title",
                                helperStyle: GoogleFonts.openSans(
                                  color: Colors.grey,
                                  fontSize: DeviceSizeConfigUtils
                                          .getDeviceHeightWithoutNotificationBar(
                                              context) *
                                      0.019,
                                  fontWeight: FontWeight.w500,
                                ),
                                labelStyle: GoogleFonts.openSans(
                                  color: Colors.white54,
                                  fontSize: DeviceSizeConfigUtils
                                          .getDeviceHeightWithoutNotificationBar(
                                              context) *
                                      0.019,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding: EdgeInsets.only(
                                  left: DeviceSizeConfigUtils
                                          .getDeviceHeightWithoutNotificationBar(
                                              context) *
                                      0.050,
                                  right: DeviceSizeConfigUtils
                                          .getDeviceHeightWithoutNotificationBar(
                                              context) *
                                      0.050,
                                ),
                                enabledBorder: userInputFormStyle(
                                    Theme.of(context).primaryColor, 2, context),
                                focusedBorder: userInputFormStyle(
                                    Theme.of(context).primaryColor, 2, context),
                                disabledBorder: userInputFormStyle(
                                    Theme.of(context).primaryColor, 2, context),
                                errorBorder:
                                    userInputFormStyle(Colors.red, 1, context),
                                focusedErrorBorder:
                                    userInputFormStyle(Colors.red, 2, context),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: DeviceSizeConfigUtils
                                    .getDeviceHeightWithoutNotificationBar(
                                        context) *
                                0.045,
                          ),
                          Container(
                            width:
                                DeviceSizeConfigUtils.getDeviceWidth(context) *
                                    0.5,
                            height:
                                DeviceSizeConfigUtils.getDeviceWidth(context) *
                                    0.5,
                            color: Colors.grey,
                            child: data.image == null
                                ? Container(
                                    alignment: Alignment.center,
                                    child: Text("no image set"))
                                : Image.file(
                                    data.image,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          SizedBox(
                            height: DeviceSizeConfigUtils
                                    .getDeviceHeightWithoutNotificationBar(
                                        context) *
                                0.045,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              await Provider.of<ImagePickerProvider>(context,
                                      listen: false)
                                  .getImage();
                            },
                            icon: Icon(Icons.camera),
                            label: Text("take picture"),
                          ),
                          SizedBox(
                            height: DeviceSizeConfigUtils
                                    .getDeviceHeightWithoutNotificationBar(
                                        context) *
                                0.045,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              formKey.currentState.save();
                              print(data.imageTitle);
                              BlocProvider.of<ProfileBloc>(context).add(
                                SaveImageToServer(
                                    profileDataHolder: ProfileHolder(
                                        title: data.imageTitle,
                                        image: data.image),
                                    token: token),
                              );
                              BlocProvider.of<ProfileBloc>(context)
                                  .add(GetAllProfiles(token: token));
                              Navigator.of(context)
                                  .pushNamed(UserProfileScreen.PAGE_ROUTE);
                            },
                            icon: Icon(Icons.save),
                            label: Text("save"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            applicationFooter(context, stateTitle),
          ],
        ),
      ),
    );
  }
}

class OnLoadingScreenWidget extends StatelessWidget {
  const OnLoadingScreenWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F4C5C),
      appBar: applicationAppbar(context, "Sign Up"),
      body: Container(
        width: DeviceSizeConfigUtils.getDeviceWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:
                  DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                          context) *
                      0.2,
              width:
                  DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                          context) *
                      0.2,
              child: LoadingIndicator(
                indicatorType: Indicator.pacman,
                color: Color(0xffFB8B24),
              ),
            ),
            SizedBox(
              height:
                  DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                          context) *
                      0.090,
            ),
            Container(
              child: Text(
                "Connecting ...",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: DeviceSizeConfigUtils
                          .getDeviceHeightWithoutNotificationBar(context) *
                      0.029,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
