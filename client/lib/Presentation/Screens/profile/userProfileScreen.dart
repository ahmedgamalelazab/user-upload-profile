//user Profile screen is just list of all images he already published on the server

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:upload_users_images/Presentation/Widgets/essentials/ApplicationAppbar.dart';
import 'package:upload_users_images/Presentation/Widgets/essentials/ApplicationFooter.dart';
import 'package:upload_users_images/config/backend.dart';
import 'package:upload_users_images/config/size.dart';
import 'package:upload_users_images/logic/ProfileBloc/profile_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  static const String PAGE_ROUTE = "/userProfileScreen";
  const UserProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: applicationAppbar(context, 'profiles'),
      body: Container(
        width: DeviceSizeConfigUtils.getDeviceWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Expanded(
                child: BlocConsumer<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is LoadedProfilesFromServer) {
                        return ListView.builder(
                          itemCount: state.profiles.length,
                          itemBuilder: (context, index) => Card(
                            child: ListTile(
                              leading: Container(
                                width: DeviceSizeConfigUtils
                                        .getDeviceHeightWithoutNotificationBar(
                                            context) *
                                    0.25,
                                height: DeviceSizeConfigUtils
                                        .getDeviceHeightWithoutNotificationBar(
                                            context) *
                                    0.25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                    BackEndConnectionConfig.getBaseUrl() +
                                        '/' +
                                        state.profiles[index]),
                              ),
                              title: Text('not now'),
                            ),
                          ),
                        );
                      }
                      return LoadingIndicator(
                        indicatorType: Indicator.pacman,
                        color: Color(0xffFB8B24),
                      );
                    },
                    listener: (context, state) {}),
              ),
            ),
            applicationFooter(context, 'profileApp'),
          ],
        ),
      ),
    );
  }
}
