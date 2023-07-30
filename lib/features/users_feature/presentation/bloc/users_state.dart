part of 'users_bloc.dart';

class UsersState {
  final States getUsersState;
  final List<UserModel> users;
  final String errorMsg;

  UsersState({this.errorMsg="",this.getUsersState=States.init, this.users=const[]});

  UsersState copyWith({
    final States ?getUsersState,
    final List<UserModel>? users,
    final String ?errorMsg,

}){

    return UsersState(
      getUsersState: getUsersState??this.getUsersState,
       users: users??this.users,
      errorMsg: errorMsg??this.errorMsg,
    );

  }


}
