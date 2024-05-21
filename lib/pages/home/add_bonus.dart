import 'package:bonus_app_admin/exports.dart';

class AddBonus extends StatefulWidget {
  const AddBonus({super.key});

  @override
  State<AddBonus> createState() => _AddBonusState();
}

class _AddBonusState extends State<AddBonus> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bonus qo'shish")),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  Input(hintText: "Harid summasi", controller: controller.summa),
                  const SizedBox(height: 16,),
                  Button(onTap: (){
                    controller.addBonus();
                  }, text: "Qo'shish")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
