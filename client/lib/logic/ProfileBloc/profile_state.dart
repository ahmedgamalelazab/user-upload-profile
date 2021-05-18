part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadingProfiles extends ProfileState {}

class LoadedProfiles extends ProfileState {
  final AddProfileModel profiles;

  LoadedProfiles({@required this.profiles});
}

class LoadingProfilesFromServer extends ProfileState {}

class LoadedProfilesFromServer extends ProfileState {
  final List<String> profiles;

  LoadedProfilesFromServer({@required this.profiles});
}
