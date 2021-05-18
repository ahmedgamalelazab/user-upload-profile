part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class SaveImageToServer extends ProfileEvent {
  final ProfileHolder profileDataHolder;
  final String token;

  SaveImageToServer({@required this.profileDataHolder, @required this.token});
}

class GetAllProfiles extends ProfileEvent {
  final String token;

  GetAllProfiles({@required this.token});
}
