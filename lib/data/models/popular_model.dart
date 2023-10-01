import 'package:crafty_bay/data/models/brand_data.dart';
import 'package:crafty_bay/data/models/category_data.dart';
import 'package:crafty_bay/data/models/product.dart';
import 'package:flutter/foundation.dart';

class ProductModel {
    String? msg;
    List<Product>? data;

    ProductModel({this.msg, this.data});

    ProductModel.fromJson(Map<String, dynamic> json) {
        msg = json['msg'];
        if (json['data'] != null) {
            data = <Product>[];
            json['data'].forEach((v) {
                data!.add(Product.fromJson(v));
            });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['msg'] = this.msg;
        if (this.data != null) {
            data['data'] = this.data!.map((v) => v?.toJson()).toList();
        }
        return data;
    }
}






