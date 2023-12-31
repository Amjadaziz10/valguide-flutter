import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:valguide3/core/route/routes.dart';
import 'core/services/firestore.dart';
import 'core/services/models.dart';
import 'features/agent/data/models/agent_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          //error screen
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              StreamProvider(
                  create: (_) => FirestoreService().streamReport(),
                  initialData: Report()),
              StreamProvider(
                  create: (_) => FirestoreService().streamFavAgent(),
                  initialData: AgentModel(status: 0, data: List.empty())),
            ],
            child: MaterialApp(
              title: 'ValGuide',
              theme: ThemeData(
                primarySwatch: Colors.blueGrey,
              ),
              debugShowCheckedModeBanner: false,
              routes: appRoutes,
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
