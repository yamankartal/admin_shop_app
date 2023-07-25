

import 'package:bloc/bloc.dart';
import 'package:shop_admin/core/constants/convert.dart';
import 'package:shop_admin/core/constants/enums.dart';

import '../../data/model/report_model.dart';
import '../../domain/use_case/get_report_case.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent,ReportState>{

  final GetReportCase getReportCase;

  ReportBloc(this.getReportCase) : super(ReportState()){


    on<GetReportEvent>((event, emit)async{
      emit(state.copyWith(getReportState: States.loading));
      final res= await getReportCase(ParamGetReport());
      res.fold((l) => emit(state.copyWith(getReportState: States.error,errorMsg: errorMsg(l))), (r) => emit(state.copyWith(getReportState: States.loaded,reportModel: r)));
    });

  }

}