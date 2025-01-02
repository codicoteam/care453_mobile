import 'package:care453/features/assessment_management/controller/assessment_controller.dart';
import 'package:care453/features/auth/Handler/auth_handler.dart';
import 'package:care453/features/view_care_professionals/controller/view_professional_controller.dart';
import 'package:care453/features/visits_management/controller/visit_controller.dart';
import 'package:care453/providers/location_provider.dart';
import 'package:care453/providers/mapStyleProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  await Supabase.initialize(url: 'https://aamokxxnfpmdpayvmngs.supabase.co', anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFhbW9reHhuZnBtZHBheXZtbmdzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNTA1MjQxNywiZXhwIjoyMDUwNjI4NDE3fQ.yYhXFOpFFO79wP0sV8zoMZLjcDmBfu5yEHcmTNONfpY');
    Get.put(ViewProfessionalController());
    Get.put(VisitController());
    Get.put(AssessmentController());

  runApp(
       MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => MapStyleProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 9, 140, 247)),
        useMaterial3: true,
      ),
      home: AuthHandler(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
