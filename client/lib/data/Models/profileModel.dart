import 'dart:io';

import 'package:flutter/widgets.dart';

abstract class Profile {}

class ProfileHolder extends Profile {
  final String title;
  final File image;

  ProfileHolder({@required this.title, @required this.image});
}

class GetProfiles extends Profile {
  bool error;
  String errorMessage;
  List<String> profiles = [];

  List<String> formattedProfilesUrls() {
    List<String> urls = [];
    profiles.forEach((profile) {
      print(profile);
      String convertedUrl = profile.replaceAll('\\', '/');
      urls.add(convertedUrl);
    });
    return urls;
  }

  GetProfiles(
      {@required this.error,
      @required this.errorMessage,
      @required this.profiles});

  GetProfiles.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorMessage = json['errorMessage'];
    profiles = json['profiles'].cast<String>();
  }
}

class AddProfileModel extends Profile {
  bool error;
  String errorMessage;
  String imagePath;
  String userId;
  String title;

  String formattedUrl() {
    return imagePath.replaceAll('\\', '/');
  }

  AddProfileModel({
    @required this.error,
    @required this.errorMessage,
    @required this.imagePath,
    @required this.userId,
    @required this.title,
  });

  AddProfileModel.fromJson(Map<String, dynamic> json) {
    this.error = json['error'];
    this.errorMessage = json['errorMessage'];
    this.imagePath = json['image'];
    this.userId = json['user_id'];
    this.title = json['title'];
  }
}
