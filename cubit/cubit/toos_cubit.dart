import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';


part 'toos_state.dart';

class ToosCubit extends Cubit<ToosState> {
  ToosCubit() : super(ToosInitial());{
   getUsers();
  }
  List<Toos> toos = [];

  getUsers() async {
    try {
      emit(ToosLoaing());
      users = await ToosService().getUsers();
      emit(ToosSucces());
    } catch (e) {
      print(e.toString());
      emit(ToosError());
    }
  }
}
