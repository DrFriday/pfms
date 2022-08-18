import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pms/src/views/signin_page.dart';
// import 'package:pms/src/views/front_page.dart';
import 'firebase_options.dart';
import 'src/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PMS',
      theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
      home:  const SignInPage(),
    );
  }
}
