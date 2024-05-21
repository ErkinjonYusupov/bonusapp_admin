import 'package:bonus_app_admin/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Bosh sahifa"),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.dialog(ConfirmDialog(
                        title: "Chiqish",
                        text: "Profildan chiqishni tasdiqlaysizm?",
                        onTap: () {
                          controller.logOut();
                        }));
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          body: SingleChildScrollView(
            child: controller.loading
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      children: [
                        UserInfo(controller: controller),
                        const SizedBox(height: 16),
                        Button(
                            onTap: () {
                              controller.scanerBarcode();
                            },
                            text: "Shtrixkod skayner"),
                        controller.statusMarket == null
                            ? const SizedBox()
                            : MarketStatus(info: controller.statusMarket!)
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
