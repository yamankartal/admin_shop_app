import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/backend_url.dart';
import 'package:shop_admin/core/constants/widgets.dart';
import 'package:shop_admin/features/categories_feature/presentation/bloc/categories_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/resposive.dart';

class ChooseProductCategoryWidget extends StatefulWidget {
  final CategoriesBloc categoriesBloc;

  const ChooseProductCategoryWidget({Key? key, required this.categoriesBloc})
      : super(key: key);

  @override
  State<ChooseProductCategoryWidget> createState() =>
      _ChooseProductCategoryWidgetState();
}

class _ChooseProductCategoryWidgetState  extends State<ChooseProductCategoryWidget> {
  late CategoriesBloc categoriesBloc;

  @override
  void initState() {
    categoriesBloc=BlocProvider.of<CategoriesBloc>(context);
    categoriesBloc.add(GetCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: Res.width * 0.8,
      height: Res.font * 1.6,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Res.padding)),
      color: AppColor.primaryColors,
      child: Text(
        "Choose product Category",
        style: TextStyle(color: Colors.white, fontSize: Res.font * 0.9),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => BottomSheet(
            onClosing: () {},
            builder: (context) => Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Res.font, vertical: Res.font),
              height: Res.height * 0.5,
              child: BlocBuilder<CategoriesBloc, CategoriesState>(
                bloc: categoriesBloc,
                buildWhen: (p, c) =>
                    p.getCategoriesState != c.getCategoriesState,
                builder: (_, state) => builder(
                  state.getCategoriesState,
                  state.errorMsg,
                  ListView.separated(
                      itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              categoriesBloc
                                  .add(ChangeProductCategoryIndex(index));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.categories[index].categoryName!,
                                  style: TextStyle(fontSize: Res.font * 1.2,color: Colors.black),
                                ),
                                Image.network(
                                  "$uploadLink/${state.categories[index].categoryImage!}",
                                  width: Res.width * 0.15,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ),
                      separatorBuilder: (_, index) =>
                          SizedBox(height: Res.font),
                      itemCount: state.categories.length),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
