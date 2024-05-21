import 'package:bonus_app_admin/exports.dart';

class RemoveBonus extends StatefulWidget {
  const RemoveBonus({super.key});

  @override
  State<RemoveBonus> createState() => _RemoveBonusState();
}

class _RemoveBonusState extends State<RemoveBonus> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bonus ayirish")),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  Text(
                    "Mijozni bonus summasi: ${controller.customer!.summa}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Input(
                      hintText: "Jami haird summasi",
                      controller: controller.summa),
                  const SizedBox(
                    height: 16,
                  ),
                  Input(
                      hintText: "Bonus summasi",
                      change: (v) {
                        setState(() {});
                      },
                      controller: controller.bonusSumma),
                  const SizedBox(
                    height: 16,
                  ),
                  controller.summa.text.trim().isEmpty ||
                          controller.bonusSumma.text.trim().isEmpty
                      ? const SizedBox()
                      : Text(
                          "To'lash uchun summa: ${int.parse(controller.summa.text) - int.parse(controller.bonusSumma.text)}"),
                  Button(
                      onTap: () {
                        controller.removeBonus();
                      },
                      text: "Ayirish")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
