part of 'categories_bloc.dart';

abstract class CategoriesEvent{}

class AddCategoryEvent extends CategoriesEvent{

  final String categoryName;
  final String categoryImage;
  final DateTime dateTime;
  AddCategoryEvent(this.categoryName, this.categoryImage, this.dateTime);


}

class DeleteCategoryEvent extends CategoriesEvent{

  final int index;
  DeleteCategoryEvent(this.index);

}


class UpdateCategoryEvent extends CategoriesEvent{

  final int categoryId;
  final String categoryName;
  final int index;
  UpdateCategoryEvent(this.categoryId ,this.categoryName, this.index);

}


class UpdateCategoryWithImageEvent extends CategoriesEvent{
  final int categoryId;
  final String categoryName;
  final String oldImage;
  final String newImage;
  final int index;
  UpdateCategoryWithImageEvent(this.categoryId, this.categoryName, this.oldImage, this.newImage, this.index);
}

class GetCategoriesEvent extends CategoriesEvent{

}

class ChooseCategoryImageEvent extends CategoriesEvent{

}

class InitChooseCategoryImageStateEvent extends CategoriesEvent{}


class GetCategoryDetailsEvent extends CategoriesEvent{
  final int categoryId;
  GetCategoryDetailsEvent(this.categoryId);
}
class ChangeProductCategoryIndex extends CategoriesEvent{
  final  int index;
  ChangeProductCategoryIndex(this.index);
}