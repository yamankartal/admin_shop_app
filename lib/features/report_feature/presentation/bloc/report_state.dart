part of 'report_bloc.dart';

class ReportState {
  final States getReportState;
  final ReportModel reportModel;
  final String errorMsg;

  ReportState(
      {this.getReportState = States.init,
      this.reportModel = const ReportModel(),
      this.errorMsg = ""});


  ReportState copyWith({
    final States ?getReportState,
    final ReportModel ?reportModel,
    final String ?errorMsg,


}){
    return ReportState(
    getReportState: getReportState??this.getReportState,
    reportModel: reportModel??this.reportModel,
    errorMsg: errorMsg??this.errorMsg,
    );
  }


}
