import 'package:flutter/material.dart';
import 'package:untitled6/Dio/APIProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => ToosCubit(),
          child: BlocConsumer<ToosCubit, ToosState>(
            listener: (context, state) {
              if (state is ToosLoaing) {
                print("Loading");
              }
            },
            builder: (context, state) {
              return state is ToosLoaing
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is ToosSucces
                      ? ListView.builder(
                          itemCount: context.watch<ToosCubit>().toos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(context.watch<ToosCubit>().users[index].name ?? "--"),
                            );
                          },
                        )
                      : Center(
                          child: Text("Error"),
                        );
            },
          ),
        ));
  }
}

