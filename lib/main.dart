import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:personal_financial_management/app/application.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_financial_management/app/observers/bloc_observer_extend.dart';
import 'package:bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCIGVsY2hn2MICXSbcPUsKmVUPa4VfC4Ns",
        appId: "1:515065352774:android:311546f23979fd77f97047",
        messagingSenderId: "515065352774",
        projectId: "personal-financel-app",
        authDomain: 'personal-financel-app.firebaseapp.com'),
  );
  Bloc.observer = BlocObserverExtend();

  runApp(MyApp());
}
