import 'package:bonus_app_admin/exports.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ChangeStatusMarket extends StatefulWidget {
  const ChangeStatusMarket({super.key});

  @override
  State<ChangeStatusMarket> createState() => _ChangeStatusMarketState();
}

class _ChangeStatusMarketState extends State<ChangeStatusMarket> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Maket holatini o'zgartirish"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Market holati:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  ToggleSwitch(
                    minWidth: 90.0,
                    initialLabelIndex: controller.statusMarket!.active,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: const [
                      'Close',
                      'Open',
                    ],
                    activeBgColors: const [
                      [Colors.pink],
                      [Colors.blue],
                    ],
                    changeOnTap: false,
                    onToggle: (index) {
                      Get.dialog(ConfirmDialog(
                          title: "Diqqat",
                          text: "Market holatini o'zgartirmoqchimisi?",
                          onTap: () {
                            controller.changeStatusMarket();
                          }));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
