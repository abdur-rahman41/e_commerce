
import 'package:e_commerce/data/models/category_model.dart';
import 'package:e_commerce/data/services/network_caller.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

  CategoryModel _categoryModel = CategoryModel();
  bool  _getCategoryInprogress=false;
  bool get  getCategoryInprogress =>_getCategoryInprogress ;
  CategoryModel get  categoryModel=>   _categoryModel;
  Future<bool> getCategories()async
   {
         _getCategoryInprogress=true;
        final  response = await NetworkCaller.getRequest(url: '/CategoryList');
        _getCategoryInprogress=false;
        if(response.isSuccess)
          {
            _categoryModel = CategoryModel.fromJson(response.returnData);
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