class BackEndConnectionConfig {
  static String getBaseUrl() {
    return 'http://localhost:3000';
  }

  static Uri getRegisterUri() {
    final uri = Uri.parse(getBaseUrl() + '/api/profileMaker/users/register');
    return uri;
  }

  static Uri getSigninUri() {
    final uri = Uri.parse(getBaseUrl() + '/api/profileMaker/users/login');
    return uri;
  }

  static Uri getAddProfileUri() {
    final uri = Uri.parse(getBaseUrl() + '/api/profileMaker/profiles/add');
    return uri;
  }

  static Uri getAllProfilesUri() {
    final uri = Uri.parse(getBaseUrl() + '/api/profileMaker/profiles');
    return uri;
  }
}
