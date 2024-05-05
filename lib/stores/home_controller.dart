import 'package:bonus_app_admin/config/my_dio.dart';
import 'package:bonus_app_admin/exports.dart';

class HomeController extends GetxController{
  var myDio = MyDio().dio();
  bool loading=false;

  fetchAuth()async{
    try{
      loading=true;
      var res = await myDio.get('/admin/auth');
      print(res);
    }catch(err){
      print(err);
    }finally{
      loading=false;
    }
  }

  @override
  void onInit() {
    fetchAuth();
    super.onInit();
  }
}