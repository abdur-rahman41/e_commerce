import 'category.dart';

class CategoryModel {
  String? msg;
  List<CategoryData>? categories;

  CategoryModel({this.msg, this.categories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categories = <CategoryData>[];
      json['data'].forEach((v) {
        categories!.add( CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['msg'] = msg;
    if (this.categories != null) {
      data['data'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


