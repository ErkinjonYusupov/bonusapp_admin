import 'package:bonus_app_admin/exports.dart';

class TariffsPage extends StatefulWidget {
  const TariffsPage({super.key});

  @override
  State<TariffsPage> createState() => _TariffsPageState();
}

class _TariffsPageState extends State<TariffsPage> {
  TariffController controller = Get.put(TariffController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TariffController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Tariflar"),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => const AddTariff());
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          body: controller.loading
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(controller.tariffs.length, (index) {
                        return TariffItem(item: controller.tariffs[index]);
                      })
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class TariffItem extends StatelessWidget {
  TariffItem({super.key, required this.item});

  TariffModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(item.summa.toString()),
                    const Text("So'mgacha"),
                  ],
                ),
                Column(
                  children: [
                    Text('${item.percent}%'),
                    Text(
                        "${((item.percent / 100) * item.summa).ceil()} max bounus"),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(item.active == 1
                            ? Icons.check_box
                            : Icons.check_box_outline_blank)),
                     Text( item.active == 1 ? "Aktiv" : "No aktiv")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.delete)),
                    const Text("O'chirish")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
