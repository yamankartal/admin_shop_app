import 'package:bloc/bloc.dart';
import 'package:shop_admin/core/constants/convert.dart';

import '../../../../core/constants/enums.dart';
import '../../data/model/delivery_details_model.dart';
import '../../data/model/delivery_model.dart';
import '../../domain/use_case/add_delivery_case.dart';
import '../../domain/use_case/banned_delivery_case.dart';
import '../../domain/use_case/delete_delivery_case.dart';
import '../../domain/use_case/get_deliveries_case.dart';
import '../../domain/use_case/get_delivery_details_case.dart';
import '../../domain/use_case/un_banned_delivery_case.dart';
import '../../domain/use_case/update_delivery_case.dart';

part 'deliveries_event.dart';
part 'deliveries_state.dart';


class DeliveriesBloc extends Bloc<DeliveriesEvent,DeliveriesState>{

 final AddDeliveryCase addDeliveryCase;
 final BannedDeliveryCase bannedDeliveryCase;
 final DeleteDeliveryCase deleteDeliveryCase;
 final GetDeliveriesCase getDeliveriesCase;
 final GetDeliveryDetailsCase getDeliveryDetailsCase;
 final UnBannedDeliveryCase unBannedDeliveryCase;
 final UpdateDeliveryCase updateDeliveryCase;

  DeliveriesBloc(this.addDeliveryCase, this.bannedDeliveryCase, this.deleteDeliveryCase, this.getDeliveriesCase, this.getDeliveryDetailsCase, this.unBannedDeliveryCase, this.updateDeliveryCase) : super(DeliveriesState()){




    on<AddDeliveryEvent>((event, emit) async{
      emit(state.copyWith(addDeliveryState: States.loading));
      final res = await addDeliveryCase(ParamAddDelivery(event.name, event.email, event.phone));
      res.fold((l) => emit(state.copyWith(addDeliveryState: States.error,errorMsg: errorMsg(l))), (r) =>emit(state.copyWith(addDeliveryState: States.loaded,deliveries: List.of(state.deliveries)..add(r))));

    });

    on<BannedDeliveryEvent>((event, emit)async{
      emit(state.copyWith(bannedDeliveryState: States.loading));
      final res = await bannedDeliveryCase(ParamBannedDelivery(state.deliveries[event.index].deliveryId!));
      res.fold((l) => emit(state.copyWith(bannedDeliveryState: States.error,errorMsg: errorMsg(l))), (r) {
        state.deliveries[event.index]=state.deliveries[event.index].copyWith(deliveryBanned: r);
        emit(state.copyWith(bannedDeliveryState: States.loaded,deliveries: List.of(state.deliveries),deliveryDetails: state.deliveryDetails.copyWith(deliveryBanned: r)));
        emit(state.copyWith(bannedDeliveryState: States.init));
      });

    });

    on<DeleteDeliveryEvent>((event, emit) async {
      emit(state.copyWith(deleteDeliveryState: States.loading));
      final res = await deleteDeliveryCase(
          ParamDeleteDelivery(state.deliveries[event.index].deliveryId!));
      res.fold((l) =>
          emit(state.copyWith(
              deleteDeliveryState: States.error, errorMsg: errorMsg(l))), (r) {
        emit(state.copyWith(deleteDeliveryState: States.loaded,
            deliveries: List.of(state.deliveries)
              ..removeAt(event.index)));
      });
    });

    on<GetDeliveriesEvent>((event, emit) async{
      emit(state.copyWith(getDeliveriesState: States.loading));
      final res = await getDeliveriesCase(ParamGetDeliveries());
      res.fold((l) => emit(state.copyWith(getDeliveriesState: States.error,errorMsg: errorMsg(l))), (r) {
        emit(state.copyWith(getDeliveriesState: States.loaded,deliveries: List.of(r)));

      });
    });

    on<UnBannedDeliveryEvent>((event, emit) async{
      emit(state.copyWith(unBannedDeliveryState: States.loading));
      final res = await unBannedDeliveryCase(ParamUnBannedDelivery(state.deliveries[event.index].deliveryId!));
      res.fold((l) => emit(state.copyWith(unBannedDeliveryState: States.error,errorMsg: errorMsg(l))), (r) {
        state.deliveries[event.index]=state.deliveries[event.index].copyWith(deliveryBanned: r);
        emit(state.copyWith(unBannedDeliveryState: States.loaded,deliveries: List.of(state.deliveries,),deliveryDetails: state.deliveryDetails.copyWith(deliveryBanned: r)));
        emit(state.copyWith(unBannedDeliveryState: States.init));

      });
    });

    on<UpdateDeliveryEvent>((event, emit) async{
        emit(state.copyWith(updateDeliveryDetailsState: States.loading));
        final res = await updateDeliveryCase(ParamUpdateDelivery(event.name, event.email, event.phone, state.deliveries[event.index].deliveryId!));
        res.fold((l) => emit(state.copyWith(updateDeliveryDetailsState: States.error,errorMsg: errorMsg(l))), (r) {
          state.deliveries[event.index]=r;
          emit(state.copyWith(updateDeliveryDetailsState: States.loaded,deliveries: List.of(state.deliveries)));
        });
    });

    on<GetDeliveryDetailsEvent>((event, emit)async{
      emit(state.copyWith(getDeliveryDetailsState: States.loading));
      final res = await getDeliveryDetailsCase(ParamGetDeliveryDetails(state.deliveries[event.index].deliveryId!));
      res.fold((l) => emit(state.copyWith(getDeliveryDetailsState: States.error,errorMsg: errorMsg(l))), (r) {
        emit(state.copyWith(getDeliveryDetailsState: States.loaded,deliveryDetails: r));
      });
    });









  }

}