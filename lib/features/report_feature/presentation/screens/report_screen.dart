import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/features/report_feature/presentation/bloc/report_bloc.dart';

import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../widgets/report_details_row_widget.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  late ReportBloc reportBloc;

  @override
  void initState() {
    reportBloc=BlocProvider.of<ReportBloc>(context);
    reportBloc.add(GetReportEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
      ),
      body: BlocBuilder<ReportBloc,ReportState>(
        buildWhen: (p,c)=>p.getReportState!=c.getReportState,
        builder: (_,state)=>builder(
          state.getReportState,
          state.errorMsg,
          Padding(padding: EdgeInsets.symmetric(vertical: Res.font,horizontal: Res.padding),
          child:Column(
            children: [
              ReportDetailsRowWidget(title: 'Total Orders Done',trailing:state.reportModel.totalOrders.toString(),),
              ReportDetailsRowWidget(title: 'Orders Rating',trailing:"${state.reportModel.ordersRating??0.roundToDouble()}%",),
              ReportDetailsRowWidget(title: 'Profits',trailing:"${state.reportModel.profits==null?0:state.reportModel.profits!.roundToDouble()} \$",),
              ReportDetailsRowWidget(title: 'Rewards Discount',trailing: "${state.reportModel.sale} \$",),
              ReportDetailsRowWidget(title: 'Total Profits',trailing:"${state.reportModel.totalProfits==null?0:state.reportModel.totalProfits!.roundToDouble()} \$",),
            ],
          )
          )
        ),
      ),
    );
  }
}
