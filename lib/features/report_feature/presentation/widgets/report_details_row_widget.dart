import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/resposive.dart';

class ReportDetailsRowWidget extends StatelessWidget {
  final String title;
  final String trailing;

  const ReportDetailsRowWidget(
      {Key? key, required this.title, required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Res.font,),
        Card(
          elevation: Res.padding,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Res.padding)
          ),
          child:
          DefaultTextStyle(
            style: TextStyle(color: Colors.black, fontSize: Res.font,),
            child:
            Padding(
                padding: EdgeInsets.symmetric(vertical: Res.font,horizontal: Res.padding),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      trailing,
                      style: TextStyle(color: AppColor.primaryColors),
                    ),
                  ],
                )
            ),
          ),
        )
      ],
    );
  }
}
