import 'package:bloc/bloc.dart';

import '../../../../core/constants/convert.dart';
import '../../../../core/constants/enums.dart';
import '../../data/model/settings_model.dart';
import '../../domain/use_case/get_settings_use_case.dart';
import '../../domain/use_case/update_settings_case.dart';

part 'settings_event.dart';
part 'settings_state.dart';


class SettingsBloc extends Bloc<SettingsEvent,SettingsState>{
  final GetSettingsCase getSettingsCase;
  final UpdateSettingsCase updateSettingsCase;

  SettingsBloc(this.getSettingsCase, this.updateSettingsCase) : super(SettingsState()){




    on<GetSettingsEvent>((event, emit) async{
      emit(state.copyWith(getSettingsState: States.loading));
      final res = await getSettingsCase(ParamGetSettings());
      res.fold((l) => emit(state.copyWith(getSettingsState: States.error,errorMsg: errorMsg(l))), (r) => emit(state.copyWith(getSettingsState: States.loaded,settings: r)));
    });

    on<UpdateSettingsEvent>((event, emit) async{
      emit(state.copyWith(updateSettingsState: States.loading));
      final res= await updateSettingsCase(ParamUpdateSettings(
          event.kilometerPrice, event.topSellingLimit, event.offerLimit, event.deliveryKilometerEarning, event.deliveryReward, event.ordersRewardNumber, event.shopLat, event.shopLong, event.increasingDeliveryAcceptingPercent, event.orderNumberIncreasingAcceptePercent));
      res.fold((l) => emit(state.copyWith(updateSettingsState: States.error,errorMsg: errorMsg(l))), (r) => emit(state.copyWith(updateSettingsState: States.loaded,settings: r)));
    });


  }
}