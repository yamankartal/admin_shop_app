import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/backend_url.dart';
import 'package:shop_admin/core/constants/widgets.dart';
import 'package:shop_admin/features/categories_feature/presentation/bloc/categories_bloc.dart';
import 'package:shop_admin/features/categories_feature/presentation/screens/update_category_screen.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../../data/model/category_model.dart';
import 'add_category_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late CategoriesBloc categoriesBloc;

  @override
  void initState() {
    categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    categoriesBloc.add(GetCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        buildWhen: (p, c) => p.getCategoriesState != c.getCategoriesState
        ||p.updateCategoryState!=c.updateCategoryState||p.updateCategoryWithImageState!=c.updateCategoryWithImageState,
        builder: (_, state) {
          if (state.getCategoriesState == States.loading) {
            return circularProgressIndicatorWidget();
          } else if (state.getCategoriesState == States.loaded) {
            return  RefreshIndicator(
                color: AppColor.primaryColors,
                child: state.categories.isEmpty?errorWidget("No Categories"):ListView.separated(
                padding: EdgeInsets.symmetric(
                    vertical: Res.padding, horizontal: Res.padding * 0.5),
                itemBuilder: (_, index) {
                  final CategoryModel categoryModel = state.categories[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: categoriesBloc,
                            child:  CategoryDetailsScreen(categoryId: categoryModel.categoryId!, index: index,),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: Res.padding,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Res.padding)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Res.padding, vertical: Res.padding),
                        child: Row(
                          children: [
                            Container(
                              width: Res.width * 0.2,
                              height: Res.height * 0.12,
                              padding: EdgeInsets.all(Res.padding),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "$uploadLink/${categoryModel.categoryImage!}"))),
                            ),
                            SizedBox(
                              width: Res.font,
                            ),
                            Expanded(
                                child: Text(
                                  categoryModel.categoryName.toString(),
                                  style: TextStyle(
                                      fontSize: Res.font,
                                      fontWeight: FontWeight.bold),
                                )),
                            Text(
                              "${categoryModel.categoryDateTime!.year.toString()}/${categoryModel.categoryDateTime!.month}/${categoryModel.categoryDateTime!.day}",
                            ),
                          ],
                        ),),
                    ),
                  );
                },
                separatorBuilder: (_, index) => SizedBox(
                  height: Res.padding,
                ),
                itemCount: state.categories.length), onRefresh:()async{
              categoriesBloc.add(GetCategoriesEvent());
            });
          } else if (state.getCategoriesState == States.error) {
            return errorWidget(state.errorMsg);
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColors,
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: categoriesBloc,
                child: const AddCategoryScreen(),
              ),
            ),
          );
        },
        child: Icon(Icons.add,size: Res.font*1.2,),
      ),
    );
  }
}
