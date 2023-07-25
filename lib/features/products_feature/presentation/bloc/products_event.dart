part of 'products_bloc.dart';

abstract class ProductsEvent {}

class AddProductEvent extends ProductsEvent {
  final String productName;
  final String productDescription;
  final double productPrice;
  final int productCategoryId;
  final int productQuantity;
  final String productImage;
  final int productDiscount;
  final DateTime productDateTime;

  AddProductEvent(
      {required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productCategoryId,
      required this.productQuantity,
      required this.productImage,
      required this.productDiscount,
      required this.productDateTime});
}

class DeleteProductEvent extends ProductsEvent {
  final int index;

  DeleteProductEvent(this.index);
}

class UpdateProductEvent extends ProductsEvent {
  final int index;
  final String productName;
  final String productDescription;
  final double productPrice;
  final int productQuantity;
  final int productDiscount;

  UpdateProductEvent(
      {required this.index,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productQuantity,
      required this.productDiscount});
}

class UpdateProductWithImageEvent extends ProductsEvent {
  final int index;
  final String productName;
  final String productDescription;
  final double productPrice;
  final int productQuantity;
  final int productDiscount;
  final String oldImage;
  final String newImage;

  UpdateProductWithImageEvent({
      required this.index,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productQuantity,
      required this.productDiscount,
      required this.oldImage,
      required this.newImage});
}

class GetProductsEvent extends ProductsEvent{

}

class GetProductDetailsEvent extends ProductsEvent{
  final int productId;

  GetProductDetailsEvent(this.productId);
}

class InitChooseProductImageEvent extends ProductsEvent{}

class ChooseProductImageEvent extends ProductsEvent{}

