import 'package:bonus_app_admin/config/icons.dart';
import 'package:bonus_app_admin/exports.dart';

class MainController extends GetxController {
  List menus = [
    {"text": "Bosh sahifa", 'icon': AppIcons.home, "page": const HomePage()},
    {"text": "Tariflar", 'icon': AppIcons.percent, "page": const TariffsPage()},
    {"text": "A'zolar", 'icon': AppIcons.users, "page": const CustomersPage()},
    {"text": "Haridlar", 'icon': AppIcons.dollor, "page": const PurchasesPage()},
  ];
  int currentPage = 0;
  Widget chooseCurrentPage() {
    return menus[currentPage]['page'];
  }

  selectPage(int index) {
    currentPage = index;
    update();
  }
}
