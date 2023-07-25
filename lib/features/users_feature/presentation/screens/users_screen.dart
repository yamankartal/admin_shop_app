import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/widgets.dart';

import '../../../../core/constants/resposive.dart';
import '../bloc/users_bloc.dart';
import '../widgets/user_item_widget.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late UsersBloc usersBloc;

  @override
  void initState() {
    usersBloc = BlocProvider.of<UsersBloc>(context);
    usersBloc.add(GetUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        buildWhen: (p, c) => p.getUsersState != c.getUsersState,
        builder: (_, state) => builder(
          state.getUsersState,
          state.errorMsg,
          ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: Res.padding,vertical: Res.font),
              itemBuilder: (_, index) =>UserItemWidget(userModel: state.users[index],

              ),
              separatorBuilder: (_, index) => SizedBox(
                    height: Res.padding,
                  ),
              itemCount: state.users.length),
        ),
      ),
    );
  }
}
