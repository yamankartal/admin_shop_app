import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../bloc/products_bloc.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      buildWhen: (p, c) => p.chooseImageState != c.chooseImageState,
      builder: (_, state) {
        if (state.chooseImageState == States.loaded) {
          return Container(
            height: Res.height * 0.3,
            width: Res.width * 0.9,
            margin: EdgeInsets.symmetric(
                vertical: Res.font, horizontal: Res.padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Res.padding),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(
                  File(state.image),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
