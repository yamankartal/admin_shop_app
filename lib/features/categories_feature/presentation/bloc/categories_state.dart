part of 'categories_bloc.dart';

class CategoriesState {
  final List<CategoryModel> categories;
  final States addCategoryState;
  final States deleteCategoryState;
  final States updateCategoryState;
  final States updateCategoryWithImageState;
  final String errorMsg;
  final States chooseCategoryImageState;
  final String ?categoryImage;
  final States getCategoryDetailsState;
  final CategoryDetailsModel category;
  final States getCategoriesState;
  final int categoryIndex;
  CategoriesState(

  {
    this.categoryIndex=-1,
    this.getCategoriesState=States.init,
    this.getCategoryDetailsState=States.init,
    this.category=const CategoryDetailsModel(),
    this.categoryImage,
    this.chooseCategoryImageState=States.init,
    this.categories=const[],
      this.addCategoryState=States.init,
      this.deleteCategoryState=States.init,
      this.updateCategoryState=States.init,
      this.updateCategoryWithImageState=States.init,
     this.errorMsg="",
  });

  CategoriesState copyWith({
    final States ?getCategoriesState,
    final List<CategoryModel> ?categories,
    final States  ?addCategoryState,
    final States  ?deleteCategoryState,
    final States ? updateCategoryState,
    final States  ?updateCategoryWithImageState,
    final String?errorMsg,
    final States? chooseCategoryImageState,
    final String? categoryImage,
    final CategoryDetailsModel? category,
    final States ?getCategoryDetailsState,
    final int ?productCategoryIndex,

}){


    return CategoriesState(
      categories: categories??this.categories,
      addCategoryState: addCategoryState??this.addCategoryState,
      deleteCategoryState: deleteCategoryState??this.deleteCategoryState,
      updateCategoryState: updateCategoryState??this.updateCategoryState,
      updateCategoryWithImageState: updateCategoryWithImageState??this.updateCategoryWithImageState,
      errorMsg: errorMsg??this.errorMsg,
      chooseCategoryImageState: chooseCategoryImageState??this.chooseCategoryImageState,
      categoryImage: categoryImage??this.categoryImage,
      getCategoryDetailsState: getCategoryDetailsState??this.getCategoryDetailsState,
      category: category??this.category,
      getCategoriesState: getCategoriesState??this.getCategoriesState,
      categoryIndex: productCategoryIndex??this.categoryIndex
    );
  }


}
