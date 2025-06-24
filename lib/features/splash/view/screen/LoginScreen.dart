import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DioData/Data.dart';
import '../../../Cubit/StateManagementCubit/DataCubit.dart';
import '../../../Cubit/StateManagementCubit/DataStates.dart';
import 'Details.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserData(Dio()))..fetchUsers(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(user: user),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is UserError) {
              return Center(child: Text("Error: ${state.error}"));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
