import 'package:bonus_app_admin/exports.dart';

class AddTariff extends StatefulWidget {
  const AddTariff({super.key});

  @override
  State<AddTariff> createState() => _AddTariffState();
}

class _AddTariffState extends State<AddTariff> {
  TariffController controller = Get.put(TariffController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TariffController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Tarif qo'shish"),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            constraints: const BoxConstraints(maxWidth: 500),
            child: controller.loading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Input(
                        hintText: "Tarif summasi",
                        controller: controller.summa,
                        type: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      Input(
                        hintText: "Tarif foizi",
                        controller: controller.percent,
                        type: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      Button(
                          onTap: () {
                            controller.add();
                          },
                          text: "Qo'shish")
                    ],
                  ),
          ),
        );
      },
    );
  }
}
