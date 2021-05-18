import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:upload_users_images/data/dataProviders/profileApi.dart';
import 'package:upload_users_images/logic/ProfileBloc/profile_bloc.dart';

import 'data/dataProviders/authApi.dart';
import 'data/repository/authRepository.dart';
import 'data/repository/profileRepository.dart';
import 'logic/AuthBloc/auth_bloc.dart';
import 'providers/imagePicker.dart';
import 'routes/ApplicationRoutes.dart';

void main() {
  //section of native code
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            authApi: AuthDataProvider(),
          ),
        ),
        RepositoryProvider(
          create: (context) => ProfileRepository(
            profileApi: ProfileApiImplentation(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(
              profileRepository:
                  RepositoryProvider.of<ProfileRepository>(context),
            ),
          ),
        ],
        child: ChangeNotifierProvider(
          create: (context) => ImagePickerProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Color(0xffFB8B24),
            ),
            routes: ApplicationRoutes.routes(),
            initialRoute: ApplicationRoutes.initialRoute(),
          ),
        ),
      ),
    );
  }
}
