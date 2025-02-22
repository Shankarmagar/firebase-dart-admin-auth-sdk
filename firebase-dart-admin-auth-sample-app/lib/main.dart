import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dart_admin_auth_sample_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_dart_admin_auth_sdk/firebase_dart_admin_auth_sdk.dart';
import 'package:flutter/foundation.dart';

void main() async {
  //If you are on web, initialize with enviroment variables
  if (kIsWeb) {
    //Pass the enviroment variables into the function below, I.E API key and project ID
    FirebaseApp.initializeAppWithEnvironmentVariables(
      apiKey: '',
      projectId: '',
    );
  } else {
    //When working with mobile
    if (Platform.isAndroid || Platform.isIOS) {
      //To initialize with service account put the path to the json file in the function below
      FirebaseApp.initializeAppWithServiceAccount(
          serviceAccountKeyFilePath: '');

      //To initialize with service account, Uncomment the functionn below then pass the service account email and user email in the function below
      //FirebaseApp.initializeAppWithServiceAccountImpersonation(serviceAccountEmail: serviceAccountEmail, userEmail: userEmail)
    }
  }

  FirebaseApp.instance.getAuth();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Admin Demo',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
