//coding the default repository

import 'package:flutter/foundation.dart';
import 'package:upload_users_images/data/Models/profileModel.dart';
import 'package:upload_users_images/data/dataProviders/profileApi.dart';

class ProfileRepository {
  final ProfileApi profileApi;

  ProfileRepository({@required this.profileApi});

  Future<AddProfileModel> postImage(ProfileHolder profile, String token) async {
    try {
      final responseRaw =
          await profileApi.addProfile(profile: profile, token: token);

      //if all are ok

      return responseRaw;
    } catch (error) {
      print(error);
    }

    //in case of failure
    return AddProfileModel(
        title: 'null',
        error: true,
        errorMessage: 'error in Repository',
        imagePath: 'null',
        userId: 'null');
  }

  Future<GetProfiles> getAllProfilesRawData({@required String token}) async {
    try {
      final responseRawData = await profileApi.getProfiles(token: token);
      //if all are ok
      return responseRawData;
    } catch (e) {
      print(e);
    }
    return GetProfiles(
        error: true, errorMessage: 'error in repository', profiles: []);
  }
}
