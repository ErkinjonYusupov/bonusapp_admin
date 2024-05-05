import 'package:bonus_app_admin/config/my_dio.dart';
import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/main_page.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;
  var myDio = MyDio().dio();

  bool validate() {
    return username.text.trim().isEmpty || password.text.trim().isEmpty;
  }
  snackbar(String message){
    Get.snackbar("Error", message,
          backgroundColor: Colors.red, colorText: Colors.white);
  }
  void login() async{
    if (validate()) {
      snackbar("Ma'lumotlarni to'liq to'ldiring");
      return;
    }
    if(loading)return;
    try{
      loading=true;
      update();
      var res = await myDio.post('/admin/login', data: {
        "username":username.text.trim(),
        "password":password.text.trim(),
      });
      GetStorage().write('token', res.data['token']);
      Get.off(()=>const MainPage());
    }on DioException catch(err){
      snackbar(err.response!.data['message']);
    }finally{
      loading=false;
      update();
    }
  }
}
