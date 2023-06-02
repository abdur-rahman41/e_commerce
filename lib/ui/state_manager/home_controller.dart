
import 'package:e_commerce/data/models/home_slider_model.dart';
import 'package:e_commerce/data/services/network_caller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

    bool _getSliderInprogress = false;
    HomeSliderModel _homeSliderModel = HomeSliderModel();

    bool get getSliderInprogress => _getSliderInprogress;
    HomeSliderModel get homeSliderModel => _homeSliderModel;

    Future<bool>   getHomeSlider()async
       {
         _getSliderInprogress = true;
        update();
         final  response =   await NetworkCaller.getRequest(url: '/ListProductSlider');
         _getSliderInprogress = false;

         if(response.isSuccess)
           {
             _homeSliderModel = HomeSliderModel.fromJson(response.returnData);
             update();
             return true;
           }
         else
           {
             update();
             return false;
           }
      }

}