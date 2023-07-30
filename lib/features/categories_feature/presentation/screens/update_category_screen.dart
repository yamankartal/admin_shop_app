import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/update_category_with_image.dart';

import '../../../../compenent/presentation/widgets/text_form_fieldWidget.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../bloc/categories_bloc.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final int categoryId;
  const CategoryDetailsScreen({Key? key, required this.categoryId, required this.index}) : super(key: key);

  final  int index;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {

  final TextEditingController name=TextEditingController();


  final GlobalKey<FormState>key=GlobalKey();

  late CategoriesBloc categoriesBloc;

  @override
  void initState() {
    categoriesBloc=BlocProvider.of<CategoriesBloc>(context);
    categoriesBloc.add(InitChooseCategoryImageStateEvent());
    categoriesBloc.add(GetCategoryDetailsEvent(widget.categoryId));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CategoriesBloc,CategoriesState>(
      buildWhen: (p,c)=>p.getCategoryDetailsState!=c.getCategoryDetailsState,
      builder: (_,state){
        if(state.getCategoryDetailsState==States.loading){
          return Scaffold(
            appBar: AppBar(
              title: Text("update"),
            ),
            body:circularProgressIndicatorWidget()
          );
        }

        else if(state.getCategoryDetailsState==States.loaded){
          return BlocConsumer<CategoriesBloc,CategoriesState>(
            listener: (_,state){
              if(state.updateCategoryState==States.error||state.updateCategoryWithImageState==States.error){
                showSnackBar(context, state.errorMsg);
              }
              else if(state.updateCategoryState==States.loaded||state.updateCategoryWithImageState==States.loaded){
                Navigator.of(context).pop();
              }
            },
            buildWhen: (p,c)=>p.updateCategoryState!=c.updateCategoryState||p.updateCategoryWithImageState!=c.updateCategoryWithImageState||p.chooseCategoryImageState!=c.chooseCategoryImageState,
            listenWhen: (p,c)=>p.updateCategoryState!=c.updateCategoryState||p.updateCategoryWithImageState!=c.updateCategoryWithImageState,
            builder: (_,state){
              if(state.updateCategoryState==States.loading||state.updateCategoryWithImageState==States.loading){
                return Scaffold(
                  appBar: AppBar(
                    title: const Text("Update"),
                  ),
                  body: circularProgressIndicatorWidget(),
                );
              }

              return Scaffold(
                appBar: AppBar(
                  title: const Text("Update"),
                ),
                body: SingleChildScrollView(
                    child:Column(
                      children: [
                        SizedBox(height: Res.font*2,),
                        Form(
                          key: key,
                          child: Column(
                            children: [
                              TextFormFieldWidget(
                                label: 'Name',
                                hint: 'Enter Category Name',
                                validate: (String? val) {
                                  print(val!.length);
                                  return val.length>5?null:"Empty";
                                },
                                textEditingController: name,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Res.font,),
                        MaterialButton(
                          minWidth: Res.width*0.7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Res.padding,
                            ),
                          ),
                          height: Res.font*1.5,
                          color: AppColor.primaryColors,
                          onPressed: (){
                            categoriesBloc.add(ChooseCategoryImageEvent());
                          },
                          child: const Text("Choose image",style: TextStyle(color: Colors.white),),
                        ),
                        BlocBuilder<CategoriesBloc,CategoriesState>(builder: (_,state){
                          if(state.chooseCategoryImageState==States.loaded) {
                            return Container(
                              height: Res.height*0.5,
                              width: Res.width*0.8,
                              margin: EdgeInsets.only(top: Res.font*2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Res.padding),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(state.categoryImage!))
                                  )
                              ),
                            );
                          }
                          return Container();
                        }),
                      ],
                    )
                ),
                bottomNavigationBar: MaterialButton(
                  onPressed: (){
                    print(name.text);
                    if(key.currentState!.validate()) {
                      if (state.chooseCategoryImageState != States.loaded) {
                        print(1);
                        categoriesBloc.add(UpdateCategoryEvent(
                            widget.categoryId, name.text, widget.index));
                      } else {
                        print(0);
                        categoriesBloc.add(UpdateCategoryWithImageEvent(
                            widget.categoryId, name.text,
                            state.category.categoryImage!, state.categoryImage!,
                            widget.index));
                      }
                    }
                  },
                  height: Res.font*2,
                  color: AppColor.primaryColors,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Res.padding),
                      topRight: Radius.circular(Res.padding),
                    ),
                  ),
                  child: Text("Done",style: TextStyle(color: Colors.white,fontSize: Res.font),),
                ),
              );

            }, );
        }

        else if(state.getCategoryDetailsState==States.error){
          return errorWidget(state.errorMsg);
        }


        return Container();
      },
    );
  }
}
