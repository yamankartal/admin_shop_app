part of 'products_bloc.dart';

class ProductsState {
  final List<ProductModel> products;
  final ProductDetailsModel productDetailsModel;
  final States getProductsState;
  final States addProductState;
  final States deleteProductState;
  final States updateProductState;
  final States updateProductWithImageState;
  final States getProductDetailsState;
  final String errorMsg;
  final States chooseImageState;
  final String image;


  ProductsState({
    this.chooseImageState=States.init, this.image="",
    this.getProductDetailsState=States.init,
      this.products=const[],
      this.getProductsState=States.init,
      this.addProductState=States.init,
      this.deleteProductState=States.init,
      this.updateProductState=States.init,
      this.updateProductWithImageState=States.init,
      this.errorMsg='',
      this.productDetailsModel=const ProductDetailsModel()
  });


  ProductsState copyWith({
    final int? productCategoryIndex,
    final List<ProductModel>? products,
    final ProductDetailsModel? productDetailsModel,

    final States ?chooseImageState,
    final String ?image,
    final States? getProductsState,
    final States? addProductState,
    final States? deleteProductState,
    final States? updateProductState,
    final States?updateProductWithImageState,
    final States ?getProductDetailsState,
    final String?errorMsg




  }){



    return ProductsState(
      addProductState: addProductState??this.addProductState,
      deleteProductState: deleteProductState??this.deleteProductState,
      updateProductState: updateProductState??this.updateProductState,
      updateProductWithImageState: updateProductWithImageState??this.updateProductWithImageState,
      getProductsState: getProductsState??this.getProductsState,
      products: products??this.products,
      productDetailsModel: productDetailsModel??this.productDetailsModel,
      errorMsg: errorMsg??this.errorMsg,
      getProductDetailsState: getProductDetailsState??this.getProductDetailsState,
      chooseImageState: chooseImageState??this.chooseImageState,
      image: image??this.image,


    );

  }


}
