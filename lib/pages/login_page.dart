import 'package:bonus_app_admin/exports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          body: controller.loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const SizedBox(height: 100),
                          Image.asset(
                            'assets/images/logo.jpg',
                            width: 150,
                          ),
                          const SizedBox(height: 50),
                          const Text(
                            "Tizimga kirish",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 50),
                          Input(
                            hintText: "Loginingizni kiriting",
                            controller: controller.username,
                          ),
                          const SizedBox(height: 16),
                          Input(
                            hintText: "Parolingizni kiriting",
                            controller: controller.password,
                            obscureText: true,
                          ),
                          const SizedBox(height: 16),
                          Button(
                            onTap: () {
                              controller.login();
                            },
                            text: "Kirish",
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
