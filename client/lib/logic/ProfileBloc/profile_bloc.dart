import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:upload_users_images/data/Models/profileModel.dart';
import 'package:upload_users_images/data/repository/profileRepository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({@required this.profileRepository}) : super(ProfileInitial());
  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is SaveImageToServer) {
      yield LoadingProfiles();
      try {
        final dataRaw = await profileRepository.postImage(
            event.profileDataHolder, event.token);
        //checking for errors
        //if all are ok
        print(dataRaw.error);
        print(dataRaw.imagePath);
        print(dataRaw.userId);
        yield LoadedProfiles(profiles: dataRaw);
      } catch (e) {
        print(e);
      }
    } else if (event is GetAllProfiles) {
      yield LoadingProfilesFromServer();
      try {
        List<String> profiles = [];
        final dataRaw =
            await profileRepository.getAllProfilesRawData(token: event.token);
        profiles = dataRaw.formattedProfilesUrls();
        profiles.forEach((element) {
          print(element);
        });
        yield LoadedProfilesFromServer(profiles: profiles);
      } catch (error) {
        print(error);
      }
    }
  }
}
