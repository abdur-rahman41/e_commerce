import 'dart:developer';

import 'package:get/get.dart';

import '../../data/models/product_by_category_model.dart';
import '../../data/services/network_caller.dart';

class ProductByRemarkController extends GetxController {
  bool _getPopularProductByRemarkInProgress = false;
  bool _getSpecialProductByRemarkInProgress = false;
  bool _getNewProductByRemarkInProgress = false;
  ProductByCategoryModel _popularProducts = ProductByCategoryModel();
  ProductByCategoryModel _specialProducts = ProductByCategoryModel();
  ProductByCategoryModel _newProducts = ProductByCategoryModel();


  bool get getPopularProductByRemarkInProgress => _getPopularProductByRemarkInProgress;
  bool get getSpecialProductByRemarkInProgress => _getSpecialProductByRemarkInProgress;
  bool get getNewProductByRemarkInProgress => _getNewProductByRemarkInProgress;

  ProductByCategoryModel get popularProductsModel => _popularProducts;
  ProductByCategoryModel get specialProductsModel => _specialProducts;
  ProductByCategoryModel get newProductsModel => _newProducts;

  Future<bool> getPopularProductsByRemark() async {
    _getPopularProductByRemarkInProgress = true;
    update();
    final response =
    await NetworkCaller.getRequest(url: '/ListProductByRemark/popular');

    _getPopularProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _popularProducts = ProductByCategoryModel.fromJson(response.returnData);
      //log(_popularProducts.toString());
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getSpecialProductsByRemark() async {
    _getSpecialProductByRemarkInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/special');
    log(response.isSuccess.toString());
    _getSpecialProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _specialProducts = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }


  Future<bool> getNewProductsByRemark() async {
    _getNewProductByRemarkInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/new');
    _getNewProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _newProducts = ProductByCategoryModel.fromJson(response.returnData);
      //log(_popularProducts.toString());
      update();
      return true;
    } else {
      update();
      return false;
    }
  }




}