import 'package:bloc/bloc.dart';
import 'package:shop_admin/core/constants/convert.dart';

import '../../../../core/constants/enums.dart';
import '../../data/model/category_details_model.dart';
import '../../data/model/category_model.dart';
import '../../domain/use_case/add_category_case.dart';
import '../../domain/use_case/delete_category_case.dart';
import '../../domain/use_case/get_categories_case.dart';
import '../../domain/use_case/get_category_details_case.dart';
import '../../domain/use_case/update_category_case.dart';
import '../../domain/use_case/update_category_with_image.dart';
import '../../domain/use_case/choose_category_image_case.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final AddCategoryCase addCategoryCase;
  final DeleteCategoryCase deleteCategoryCase;
  final GetCategoriesCase getCategoriesCase;
  final UpdateCategoryCase updateCategoryCase;
  final UpdateCategoryWithImageCase updateCategoryWithImageCase;
  final ChooseCategoryImageCase chooseCategoryImageCase;
  final GetCategoryDetailsCase getCategoryDetailsCase;

  CategoriesBloc(
      this.chooseCategoryImageCase,
      this.addCategoryCase,
      this.deleteCategoryCase,
      this.getCategoriesCase,
      this.updateCategoryCase,
      this.updateCategoryWithImageCase, this.getCategoryDetailsCase)
      : super(CategoriesState()) {
    on<AddCategoryEvent>(
      (event, emit) async {
        emit(state.copyWith(addCategoryState: States.loading));
        final res = await addCategoryCase(ParamAddCategory(
            event.categoryName, event.categoryImage, event.dateTime));
        res.fold(
          (l) => emit(
            state.copyWith(
              addCategoryState: States.error,
              errorMsg: errorMsgg(l, "can not add category"),
            ),
          ),
          (r) => emit(
            state.copyWith(
              addCategoryState: States.loaded,
              categories: List.of(state.categories)..add(r),
            ),
          ),
        );
      },
    );

    on<DeleteCategoryEvent>(
      (event, emit) async {
        emit(state.copyWith(deleteCategoryState: States.loading));
        final CategoryModel categoryModel = state.categories[event.index];
        final res = await deleteCategoryCase(ParamDeleteCategory(
            categoryModel.categoryId!, categoryModel.categoryImage!));
        res.fold(
          (l) => emit(
            state.copyWith(
              deleteCategoryState: States.error,
              errorMsg: errorMsgg(l, "can not delete category"),
            ),
          ),
          (r) => emit(
            state.copyWith(
                deleteCategoryState: States.loaded,
                categories: List.of(state.categories)..removeAt(event.index)),
          ),
        );
      },
    );

    on<UpdateCategoryEvent>(
      (event, emit) async {
        emit(state.copyWith(updateCategoryState: States.loading));
        final res = await updateCategoryCase(
            ParamUpdateCategory(event.categoryId, event.categoryName));
        res.fold(
          (l) => emit(
            state.copyWith(
              updateCategoryState: States.error,
              errorMsg: errorMsgg(l, "can not update category"),
            ),
          ),
          (r) {
            state.categories[event.index] =
                state.categories[event.index].copyWith(
              categoryName: event.categoryName,
            );

            emit(
              state.copyWith(
                updateCategoryState: States.loaded,
                categories: List.of(state.categories),
              category:   state.category.copyWith(
                categoryName: event.categoryName,
              ),
              ),
            );
          },
        );
      },
    );

    on<UpdateCategoryWithImageEvent>( (event, emit) async {
        emit(state.copyWith(updateCategoryWithImageState: States.loading));
        final res =
            await updateCategoryWithImageCase(ParamUpdateWithImageCategory(
            event.categoryId,event.categoryName,event.oldImage,event.newImage
        ));
        res.fold(
          (l) => emit(
            state.copyWith(
              updateCategoryWithImageState: States.error,
              errorMsg: errorMsgg(l, "can not update category"),
            ),
          ),
          (r) {


            state.categories[event.index]=state.categories[event.index].copyWith(
              categoryName: event.categoryName,
              categoryImage:r,
            );



            emit(
              state.copyWith(
                updateCategoryWithImageState: States.loaded,
                categories: List.of(state.categories),
                category:   state.category.copyWith(
                  categoryName: event.categoryName,
                  categoryImage:r,
                ),
              ),
            );
          },
        );
      }, );


    on<GetCategoriesEvent>( (event, emit) async {
        emit(state.copyWith(getCategoriesState: States.loading));
        final res =
            await getCategoriesCase(ParamGetCategories());
        res.fold(
          (l) => emit(
            state.copyWith(
              getCategoriesState: States.error,
              errorMsg: errorMsg(l),
            ),
          ),
          (r) {
            emit(
              state.copyWith(
                getCategoriesState: States.loaded,
                categories: List.of(r),
              ),
            );
          },
        );
      },
    );

    on<ChooseCategoryImageEvent>((event, emit) async{
      final res =await chooseCategoryImageCase(ParamChooseCategoryImage());
      res.fold((l) => emit(state.copyWith(chooseCategoryImageState: States.error)), (r) => emit(state.copyWith(chooseCategoryImageState: States.loaded,categoryImage: r)));
    });


     on<InitChooseCategoryImageStateEvent>((event, emit){
       emit(state.copyWith(chooseCategoryImageState: States.init));
     });

     on<GetCategoryDetailsEvent>((event, emit)async{
       emit(state.copyWith(getCategoryDetailsState: States.loading));
       final res =await getCategoryDetailsCase(ParamGetCategoryDetails(event.categoryId));
       res.fold((l) => emit(state.copyWith(getCategoryDetailsState: States.error,errorMsg: errorMsg(l))), (r) => emit(state.copyWith(getCategoryDetailsState: States.loaded,category: r)));
     });

    on<ChangeProductCategoryIndex>((event, emit){
      emit(state.copyWith(productCategoryIndex: event.index));
    });
  }
}
