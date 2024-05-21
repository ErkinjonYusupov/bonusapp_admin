import 'package:bonus_app_admin/config/my_dio.dart';
import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/models/customer.dart';
import 'package:bonus_app_admin/models/home/status_market.dart';
import 'package:bonus_app_admin/models/home/user.dart';
import 'package:bonus_app_admin/pages/home/actions_page.dart';

class HomeController extends GetxController {
  var myDio = MyDio().dio();
  bool loading = false;

  UserModel? user;

  fetchAuth() async {
    try {
      loading = true;
      var res = await myDio.get('/admin/auth');
      user = UserModel.fromJson(res.data);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  logOut() async {
    await GetStorage().remove('token');
    Get.offAll(() => const LoginPage());
  }

  @override
  void onInit() {
    fetchAuth();
    fetchStatusMarket();
    super.onInit();
  }

  String barcode = '';
  scanerBarcode() async {
    if (loading) return;
    loading = true;
    // var res = await Get.to(() => const SimpleBarcodeScannerPage());
    // barcode = res;
    barcode = '1714923662694';
    Get.to(() => const ActionsPage());
    getCustomerFromBarcode();
  }

  CustomerModel? customer;
  getCustomerFromBarcode() async {
    try {
      var res = await myDio.get('/customer/get_customer_from_barcode/$barcode');
      customer = CustomerModel.fromJson(res.data);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  snackbar(String message) {
    Get.snackbar("Error", message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  TextEditingController summa = TextEditingController();
  TextEditingController bonusSumma = TextEditingController();

  addBonus() async {
    if (loading) return;
    if (summa.text.trim().isEmpty) {
      snackbar("Summani kiriting");
      return;
    }
    try {
      loading = true;
      update();
      var res = await myDio.put('/actions/add_bonus/${customer!.id}',
          data: {"summa": summa.text.trim()});
      summa.clear();
      Get.back();
      Get.back();
      Get.snackbar("Qo'shildi", res.data['message']);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  removeBonus() async {
    if (loading) return;
    if (summa.text.trim().isEmpty || bonusSumma.text.trim().isEmpty) {
      snackbar("Ma'lumotlarni to'liq kiriting");
      return;
    }
    if (customer!.summa < int.parse(bonusSumma.text.trim())) {
      snackbar(
          "Kiritilgan bonus summa mijozning mavjud bonus summasidan katta");
      return;
    }
    try {
      loading = true;
      update();
      var res = await myDio.put('/actions/remove_bonus/${customer!.id}', data: {
        "summa": summa.text.trim(),
        "bonus_summa": bonusSumma.text.trim()
      });
      summa.clear();
      bonusSumma.clear();
      Get.back();
      Get.back();
      Get.snackbar("Qo'shildi", res.data['message']);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  //market holatini olish
  StatusMarket? statusMarket;
  fetchStatusMarket() async {
    try {
      loading = true;
      update();
      var res = await myDio.get('/admin/statusMarket');
      statusMarket = StatusMarket.fromJson(res.data['data'][0]);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }
  changeStatusMarket() async {
    try {
      if(loading)return;
      loading = true;
      update();
      var res = await myDio.put('/admin/changeStatusMarket');
      statusMarket!.active=res.data['statusMarket'];
      print(res);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }
}
