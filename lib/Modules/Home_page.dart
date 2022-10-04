
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_clinco/cubit/home_cubit_cubit.dart';
import 'package:new_clinco/cubit/home_cubit_state.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) { },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl, 
          child: SafeArea(
            child: Scaffold(

            )
          )
        );
      },
    );
  }
}