import 'package:bloc/bloc.dart';
import 'package:shop_admin/core/constants/convert.dart';

import '../../../../core/constants/enums.dart';
import '../../data/model/user_model.dart';
import '../../domain/use_case/get_users_case.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent,UsersState>{
  final GetUsersCase getUsersCase;

  UsersBloc(this.getUsersCase) : super(UsersState()){

    on<GetUsersEvent>((event, emit)async {
      emit(state.copyWith(getUsersState: States.loading));
      final res= await getUsersCase(ParamGetUsers());
      res.fold((l) => emit(state.copyWith(getUsersState: States.error,errorMsg: errorMsg(l))), (r) => emit(state.copyWith(getUsersState: States.loaded,users: List.of(r))));
    });

  }
}