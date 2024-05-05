import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/splash_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init();
   await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}

