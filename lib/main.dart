import 'package:dynamic_island/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  onErrorIgnoreOverflowErrors(
    FlutterErrorDetails details, {
    bool forceReport = false,
  }) {
    // ---

    bool ifIsOverflowError = false;

    // Detect overflow error.
    var exception = details.exception;
    if (exception is FlutterError) {
      ifIsOverflowError = !exception.diagnostics.any(
          (e) => e.value.toString().startsWith("A RenderFlex overflowed by"));
    }

    // Ignore if is overflow error.
    if (ifIsOverflowError) {
      debugPrint('Overflowed.');
    } else {
      FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
    }
  }

  @override
  void initState() {
    FlutterError.onError = onErrorIgnoreOverflowErrors;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
