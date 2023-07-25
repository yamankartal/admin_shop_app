import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../compenent/presentation/widgets/text_form_fieldWidget.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../core/constants/colors.dart';
import '../bloc/categories_bloc.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {

  final TextEditingController name=TextEditingController();


  final GlobalKey<FormState>key=GlobalKey();

  late CategoriesBloc categoriesBloc;

  @override
  void initState() {
    categoriesBloc=BlocProvider.of<CategoriesBloc>(context);
    categoriesBloc.add(InitChooseCategoryImageStateEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<CategoriesBloc,CategoriesState>(
        listener: (_,state){
          if(state.addCategoryState==States.error){
            showSnackBar(context, state.errorMsg);
          }
          else if(state.addCategoryState==States.loaded){
            Navigator.of(context).pop();
          }
        },
        buildWhen: (p,c)=>p.addCategoryState!=c.addCategoryState||p.chooseCategoryImageState!=c.chooseCategoryImageState,
        listenWhen: (p,c)=>p.addCategoryState!=c.addCategoryState,
        builder: (_,state){
      if(state.addCategoryState==States.loading){
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add Category"),
          ),
          body: circularProgressIndicatorWidget(),
        );
      }

      return Scaffold(
        appBar: AppBar(
          title: const Text("Add Category"),
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
                        return val!.length>5?null:"Empty";
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
            if(state.chooseCategoryImageState!=States.loaded){
              showSnackBar(context,"choose image");
            }
            else{
              if(key.currentState!.validate()){
                print(0);
                categoriesBloc.add(AddCategoryEvent(name.text, state.categoryImage!, DateTime.now()));
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
}
