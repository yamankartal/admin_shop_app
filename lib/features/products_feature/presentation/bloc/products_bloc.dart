import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

import '../../../../core/constants/convert.dart';
import '../../../../core/constants/enums.dart';
import '../../data/model/product_details_model.dart';
import '../../data/model/products_model.dart';
import '../../domain/use_case/add_product_case.dart';
import '../../domain/use_case/choose_image.dart';
import '../../domain/use_case/delete_product_case.dart';
import '../../domain/use_case/get_product_details_case.dart';
import '../../domain/use_case/get_products_case.dart';
import '../../domain/use_case/update_product_case.dart';
import '../../domain/use_case/update_product_with_image.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final AddProductCase addProductCase;
  final DeleteProductCase deleteProductCase;
  final GetProductCase getProductCase;
  final UpdateProductCase updateProductCase;
  final UpdateProductWithImageCase updateProductWithImageCase;
  final GetProductDetailsCase getProductDetailsCase;
  final ChooseProductImageCase chooseProductImageCase;
  ProductsBloc(this.addProductCase, this.deleteProductCase, this.getProductCase,
      this.updateProductCase, this.updateProductWithImageCase, this.getProductDetailsCase, this.chooseProductImageCase)
      : super(ProductsState()) {


    on<AddProductEvent>((event, emit) async {
        emit(state.copyWith(addProductState: States.loading));
        final res = await addProductCase(ParamAddProduct(
            productName: event.productName,
            productDescription: event.productDescription,
            productPrice: event.productPrice,
            productCategoryId: event.productCategoryId,
            productQuantity: event.productQuantity,
            productImage: event.productImage,
            productDiscount: event.productDiscount,
            productDateTime: event.productDateTime));
        res.fold(
          (l) => emit(state.copyWith(
              addProductState: States.error,
              errorMsg: errorMsgg(l, "cannot add product"))),
          (r) => emit(
            state.copyWith(addProductState: States.loaded, productDetailsModel:r),
          ),
        );
      },
    );

    on<DeleteProductEvent>((event, emit)async{
      emit(state.copyWith(deleteProductState: States.loading));
     final res = await deleteProductCase(ParamDeleteProduct(productId:state.products[event.index].productId!, image:state.products[event.index].productImage!));
     res.fold((l) => emit(state.copyWith(deleteProductState: States.error,errorMsg: errorMsg(l))), (r) =>emit(state.copyWith(deleteProductState: States.loaded,products: List.of(state.products)..removeAt(event.index))));


    });

    on<UpdateProductEvent>((event, emit)async{
      emit(state.copyWith(updateProductState: States.loading));
      final ProductDetailsModel productDetailsModel=state.productDetailsModel.copyWith(
          productDescription:event.productDescription,
          productName:event.productName,
          productDiscount:event.productDiscount,
          productPrice:event.productPrice,
          productQuantity:event.productQuantity,
      );
      final ProductModel productModel=state.products[event.index].copyWith(
        productName: event.productName,
      );

      final res = await updateProductCase(ParamUpdateProduct(
        productDescription:productDetailsModel.productDescription!,
        productName:productDetailsModel.productName!,
        productDiscount:productDetailsModel.productDiscount!,
        productId: productDetailsModel.productId!,
        productPrice: productDetailsModel.productPrice!,
        productQuantity: productDetailsModel.productQuantity!,
      ));
      res.fold(
            (l) => emit(state.copyWith(
                updateProductState: States.error,
            errorMsg: errorMsg(l))),
            (r) {
              state.products[event.index]=productModel;
              emit(
                state.copyWith(updateProductState: States.loaded,
                    productDetailsModel: productDetailsModel,
                  products: List.of(state.products)
                ),
              );
            }
      );
    });

    on<UpdateProductWithImageEvent>((event, emit)async{

      emit(state.copyWith(updateProductWithImageState: States.loading));
      final ProductDetailsModel productDetailsModel=state.productDetailsModel.copyWith(
        productDescription:event.productDescription,
        productName:event.productName,
        productDiscount:event.productDiscount,
        productPrice:event.productPrice,
        productQuantity:event.productQuantity,
        productImage:event.newImage,
      );
      final res = await updateProductWithImageCase(ParamUpdateProductWithImage(
        productDescription:productDetailsModel.productDescription!,
        productName:productDetailsModel.productName!,
        productDiscount:productDetailsModel.productDiscount!,
        productId: productDetailsModel.productId!,
        productPrice: productDetailsModel.productPrice!,
        productQuantity: productDetailsModel.productQuantity!, newImage: productDetailsModel.productImage!, oldImage: event.oldImage,
      ));
      res.fold(
            (l) {
              print("left");
              emit(state.copyWith(
                  updateProductWithImageState: States.error,
                  errorMsg: errorMsgg(l, "cannot update product")));
            },
            (r) {
              state.products[event.index]=state.products[event.index].copyWith(
                productName:event.productName,
                productImage: r,
              );

              emit(
                state.copyWith(updateProductWithImageState: States.loaded,productDetailsModel: productDetailsModel.copyWith(productImage: r),
                    products: List.of(state.products)
                ),


              );
            },
      );


    });

    on<GetProductsEvent>((event, emit) async{

      emit(state.copyWith(getProductsState: States.loading));
      final res = await getProductCase(ParamGetProducts());
      res.fold(
            (l) => emit(state.copyWith(
                getProductsState: States.error,
            errorMsg: errorMsgg(l, "cannot add product"))),
            (r) => emit(
          state.copyWith(getProductsState: States.loaded,products:List.of(r)),
        ),
      );


    });

    on<GetProductDetailsEvent>((event, emit)async{
      emit(state.copyWith(getProductDetailsState: States.loading));
      final  res = await getProductDetailsCase(ParamGetProductDetails(event.productId));
      res.fold((l) => emit(state.copyWith(getProductDetailsState: States.error,errorMsg: errorMsg(l))), (r) => emit(state.copyWith(getProductDetailsState: States.loaded,productDetailsModel: r)));
    });


    on<InitChooseProductImageEvent>((event, emit) {
      emit(state.copyWith(chooseImageState: States.init));
    });


 on<ChooseProductImageEvent>((event, emit) async{
   emit(state.copyWith(chooseImageState: States.loading));
   final res =await chooseProductImageCase(ParamChooseProductImage());
   res.fold((l) {}, (r) =>emit(state.copyWith(chooseImageState: States.loaded,image: r)));
 });




  }
}
