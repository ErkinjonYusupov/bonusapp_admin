import 'dart:async';

import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void hasToken() {
    var token = GetStorage().read('token');
    Timer(const Duration(seconds: 2), () {
      if (token == null) {
        Get.off(() => const LoginPage());
      } else {
        Get.off(() => const MainPage());
      }
    });
  }

  @override
  void initState() {
    hasToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
