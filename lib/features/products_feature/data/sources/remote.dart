
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shop_admin/core/constants/backend_url.dart';
import 'package:shop_admin/core/constants/failures.dart';

import '../model/product_details_model.dart';
import '../model/products_model.dart';

class ProductsRemote{



  Future<ProductDetailsModel?>addProduct(Map<String, dynamic> data)async{
    try {
      final File file = File(data['product_image']);
      final request = http.MultipartRequest("POST", Uri.parse(addCategoryLink));
      final length = await file.length();
      final stream = http.ByteStream(file.openRead());
      final multiPartFile = http.MultipartFile(
          "product_image", stream, length, filename: file.path);
      request.files.add(multiPartFile);


      data.forEach((key, value) {
        if (value != 'product_image') {
          request.fields[key] = value;
        }
      });

      final fileResponse = await request.send();
      if (fileResponse.statusCode == 200) {
        final response = await http.Response.fromStream(fileResponse);
        final res = jsonDecode(response.body);
        if (res['success']) {
          final Map<String,dynamic> map=res['added_product'];
          return ProductDetailsModel.fromJson(map);
        }
        return null;
      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }


  Future<bool>deleteProduct(int productId, Map<String, dynamic> data)async{
    try{
         final response=await http.post(Uri.parse(deleteProductsLink),body: data..addAll({'product_id':productId.toString()}));
         if(response.statusCode==200){
           final res=jsonDecode(response.body);
           return res['success'];
         }
         throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<List<ProductModel>>getProducts()async{
    try{
        final response=await http.post(Uri.parse(getProductsLink));
        if(response.statusCode==200){
          final res=jsonDecode(response.body);
          if(res['success']){
            final List list=res['products'];
            return list.map((e) => ProductModel.fromJson(e)).toList();
          }
          return [];
        }
        throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<bool>updateProduct(int productId, Map<String, dynamic> data)async{
    try{

      final response=await http.post(Uri.parse(updateProductLink),body: data..addAll({'product_id':productId.toString()}));
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        return res['success'];
      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<String?>updateProductWithImage(int productId, Map<String, dynamic> data)async{
    try{

      final File file = File(data['new_image']);
      final request = http.MultipartRequest("POST", Uri.parse(updateProductWithImageLink));
      final length = await file.length();
      final stream = http.ByteStream(file.openRead());
      final multiPartFile = http.MultipartFile("new_image", stream, length, filename: file.path);
      request.files.add(multiPartFile);

      data.addAll({'product_id':productId.toString()});
      data.forEach((key, value) {
        if (value != 'new_image') {
          request.fields[key] = value;
        }
      });

      final fileResponse = await request.send();
      if (fileResponse.statusCode == 200) {
        final response = await http.Response.fromStream(fileResponse);
        final res = jsonDecode(response.body);
        print(res);
         return res['success']?res['new_image']:null;
        }


      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<Map>getProductDetails(int productId)async{
    try{
      final response=await http.post(Uri.parse(getProductDetailsLink),body:{"product_id":productId.toString()});
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        return res;
      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<String?> chooseImage() async {
    final File? image;
    final imagePicker = ImagePicker();
    final res =
    await imagePicker.getImage(source: ImageSource.gallery);
    if (res != null) {
      image = File(res.path);
      return image.path;
    }
    return null;
  }


}