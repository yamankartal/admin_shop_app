part of 'settings_bloc.dart';

class SettingsState {
  final States getSettingsState;
  final States updateSettingsState;
  final SettingsModel settings;
  final String errorMsg;

  SettingsState(
      {this.getSettingsState=States.init,
      this.updateSettingsState=States.init,
      this.settings=const SettingsModel(),
      this.errorMsg=" "});



  SettingsState copyWith({

    final States ?getSettingsState,
    final States ?updateSettingsState,
    final SettingsModel? settings,
    final String? errorMsg,


  }){


    return SettingsState(
      getSettingsState: getSettingsState??this.getSettingsState,
      updateSettingsState: updateSettingsState??this.updateSettingsState,
      settings: settings??this.settings,
       errorMsg: errorMsg??this.errorMsg,
    );
  }
}
