import 'dart:developer';

import 'package:e_commerce/data/models/product_details_model.dart';
import 'package:get/get.dart';

import '../../data/models/product_by_category_model.dart';
import '../../data/services/network_caller.dart';

class ProductController extends GetxController {
  bool _getProductsByCategoryInProgress = false;
  bool _getProductsDetailsInProgress = false;
  ProductByCategoryModel _productByCategoryModel = ProductByCategoryModel();
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  bool get getProductsByCategoryInProgress => _getProductsByCategoryInProgress;
  bool get getProductsDetailsInProgress =>   _getProductsDetailsInProgress ;
  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  ProductByCategoryModel get productByCategoryModel => _productByCategoryModel;

  Future<bool> getProductsByCategory(int categoryId) async {
    _getProductsByCategoryInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(
        url: '/ListProductByCategory/$categoryId');
    _getProductsByCategoryInProgress = false;
    if (response.isSuccess) {
      _productByCategoryModel =
          ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getProductsDetails(int productId) async {
    _getProductsDetailsInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(
        url: '/ListProductByCategory/$productId');
    _getProductsDetailsInProgress = false;
    if (response.isSuccess) {
      _productByCategoryModel =
          ProductByCategoryModel.fromJson(response.returnData);
      log(response.returnData.toString());
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}