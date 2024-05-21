import 'package:bonus_app_admin/exports.dart';


class TariffController extends GetxController {
  TextEditingController summa = TextEditingController();
  TextEditingController percent = TextEditingController();
  bool loading = false;
  var myDio = MyDio().dio();

  validate() {
    return summa.text.trim().isEmpty || percent.text.trim().isEmpty;
  }

  snackbar(String message) {
    Get.snackbar("Error", message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  add() async {
    if (validate()) {
      snackbar("Ma'lumotlarni to'liq to'ldiring");
      return;
    }
    if (loading) return;
    try {
      loading = true;
      update();
      await myDio.post('/tariff',
          data: {"summa": summa.text, "percent": percent.text});
      fetchTariffs();
      Get.back();
      Get.snackbar("Done", "Terif yaratildi");
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }
List<TariffModel> tariffs=[];
  fetchTariffs() async {
    try {
      loading=true;
      update();
      var res = await myDio.get('/tariff');
      tariffs = tariffsListFromModel(res.data);
    } catch (err) {
      print(err);
    }finally{
      loading=false;
      update();
    }
  }

  // await myDio.delete('/tariff/$id');

  // await myDio.put('/tariff/active/$id');

  @override
  void onInit() {
    fetchTariffs();
    super.onInit();
  }
}
