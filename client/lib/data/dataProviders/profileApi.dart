import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../../config/backend.dart';

import '../Models/profileModel.dart';

import 'package:http/http.dart' as http;

//here we will send the image and the title back to the server
abstract class ProfileApi {
  Future<AddProfileModel> addProfile(
      {@required ProfileHolder profile, @required String token});
  Future<GetProfiles> getProfiles({@required String token});
}

class ProfileApiImplentation extends ProfileApi {
  @override
  Future<AddProfileModel> addProfile(
      {@required ProfileHolder profile, @required String token}) async {
    try {
      final request = http.MultipartRequest(
          'POST', BackEndConnectionConfig.getAddProfileUri());
      request.fields['title'] = profile.title;
      request.files.add(
        await http.MultipartFile.fromPath('img', profile.image.path),
      );
      request.headers.addAll(
        {"Content-Type": "multipart/form-data", "x-auth-token": token},
      );
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Result: ${response.statusCode}");
      // print(response.body);
      return AddProfileModel.fromJson(json.decode(response.body));
    } catch (error) {
      print(error);
    }
    return AddProfileModel(
        title: "null",
        error: true,
        errorMessage: "error in data Provider",
        imagePath: "null",
        userId: "null");
  }

  @override
  Future<GetProfiles> getProfiles({@required String token}) async {
    try {
      final response = await http.get(
          BackEndConnectionConfig.getAllProfilesUri(),
          headers: {"x-auth-token": token});
      //if all are ok
      print(response.body);
      if (response.statusCode == 200) {
        final responseParser =
            json.decode(response.body) as Map<String, dynamic>;
        return GetProfiles.fromJson(responseParser);
      } else {
        print('error kosm hena');
        return GetProfiles(
            error: true, errorMessage: 'error in NetWork', profiles: []);
      }
    } catch (error) {
      print(error);
    }
    //in case of damn failure
    return GetProfiles(
        error: true, errorMessage: 'error in NetWork', profiles: []);
  }
}
