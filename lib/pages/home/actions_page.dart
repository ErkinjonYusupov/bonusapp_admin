import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/home/remove_bonus.dart';

class ActionsPage extends StatefulWidget {
  const ActionsPage({super.key});

  @override
  State<ActionsPage> createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Ammallar"),
        ),
        body: controller.loading || controller.customer == null
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(controller.customer!.name),
                      leading: const Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text('+${controller.customer!.username}'),
                      leading: const Icon(Icons.phone),
                    ),
                    ListTile(
                      title: Text(controller.customer!.code),
                      leading: const Icon(Icons.qr_code_2_rounded),
                    ),
                    ListTile(
                      title: Text(controller.customer!.summa.toString()),
                      leading: const Icon(Icons.attach_money_sharp),
                    ),
                    Button(
                        onTap: () {
                          Get.to(() => const AddBonus());
                        },
                        text: "Bonus qo'shish"),
                    const SizedBox(
                      height: 16,
                    ),
                    controller.customer!.summa > 1000
                        ? Button(
                            onTap: () {
                          Get.to(() => const RemoveBonus());

                            },
                            text: "Bonusdan ayirish",
                            color: Colors.red,
                          )
                        : const SizedBox()
                  ],
                ),
              ),
      );
    });
  }
}
