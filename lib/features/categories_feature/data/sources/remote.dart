import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shop_admin/core/constants/backend_url.dart';
import 'package:shop_admin/core/constants/failures.dart';

import '../model/category_model.dart';

class CategoriesRemote {

  Future<Map> addCategory(Map<String, dynamic> data) async {
    try {

      final File file = File(data['category_image']);
      final request = http.MultipartRequest("POST", Uri.parse(addCategoryLink));
      final length = await file.length();
      final stream = http.ByteStream(file.openRead());
      final multiPartFile = http.MultipartFile("category_image", stream, length,
          filename: file.path);
      request.files.add(multiPartFile);


      data.forEach((key, value) {
        if (value != 'category_image') request.fields[key] = value;
      });
      final response = await request.send();
      if (response.statusCode == 200) {
        final res = await http.Response.fromStream(response);
        final r = jsonDecode(res.body);
        return r;
      }
      throw ServerFailure();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteCategory(int categoryId, String image) async {
    try {
      final response = await http.post(
          Uri.parse(
            deleteCategoryLink,
          ),
          body: {
            'category_id': categoryId.toString(),
            "category_image": image
          });
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if (res['success']) {
          return true;
        }
        return false;
      }
      throw ServerFailure();
    } catch (e) {
      throw ServerFailure();
    }
  }

  Future<bool> updateCategory(Map<String, dynamic> data, int categoryId) async {
    try {
      final response = await http.post(Uri.parse(updateCategoryLink),
          body: data..addAll({"category_id": categoryId.toString()}));
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if (res['success']) {
          return true;
        }
        return false;
      }
      throw ServerFailure();
    } catch (e) {
      throw ServerFailure();
    }
  }

  Future<String?> updateCategoryWithImage(Map<String, dynamic> data,
      int categoryIdx) async {
    try {
      final File file = File(data['new_image']);
      final request =
      http.MultipartRequest("POST", Uri.parse(updateCategoryWithImageLink));
      final length = await file.length();
      final stream = http.ByteStream(file.openRead());
      final multiPartFile =
      http.MultipartFile("new_image", stream, length, filename: file.path);
      request.files.add(multiPartFile);

      request.fields['category_id'] = categoryIdx.toString();

      data.forEach((key, value) {
        if (value != 'new_image') {
          request.fields[key] = value;
        }
      });

      final response = await request.send();
      if (response.statusCode == 200) {
        final res = await http.Response.fromStream(response);
        final r = jsonDecode(res.body);

        if (r['success']) {
          return r['image'];
        } else {
          return null;
        }
      }
      print(response);
      throw ServerFailure();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await http.post(
        Uri.parse(
          getCategoriesLink,
        ),
      );
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if (res['success']) {
          final List list = res['categories'];
          return list.map((e) => CategoryModel.fromJson(e)).toList();
        }
        return [];
      }
      throw ServerFailure();
    } catch (e) {
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

  Future<Map>getCategoryDetails(int categoryId)async{
    try {
      final response = await http.post(
        Uri.parse(
          getCategoryDetailsLink,
        ),
        body: {'category_id':categoryId.toString()}
      );
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        return res;
      }
      throw ServerFailure();
    } catch (e) {
      throw ServerFailure();
    }
  }


}
