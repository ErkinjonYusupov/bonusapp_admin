import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/stores/main_controller.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: List.generate(controller.menus.length, (index) {
                var item = controller.menus[index];
                return Expanded(
                    child: InkWell(
                  onTap: () {
                    controller.selectPage(index);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        item['icon'],
                        width: 20,
                        color: controller.currentPage == index
                            ? Colors.red
                            : Colors.grey[700],
                      ),
                      Text(
                        item['text'],
                        style: TextStyle(
                            color: controller.currentPage == index
                                ? Colors.red
                                : Colors.grey[700]),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ));
              }),
            ),
          ),
          body: controller.chooseCurrentPage(),
        );
      },
    );
  }
}
