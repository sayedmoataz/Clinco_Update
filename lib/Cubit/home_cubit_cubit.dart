

// ignore_for_file: deprecated_member_use


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../Shared/constant.dart';
import '../Shared/network/local/cache_helper.dart';
import 'home_cubit_state.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(contaxt) => BlocProvider.of(contaxt);
  
  void launchUrl2(fbUrl) async {
    String url = fbUrl;
    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    }
  }

  var responseUpgrade;
  Future<void> forceUpgrade() async{
    emit(HomeGetStoresLoadingState());
    await http.get(
      Uri.parse("https://appupgrade.dev/api/v1/versions/check?app_name=hadayek_hof&app_version=$appVersion&platform=android&environment=production"),
      headers: {"x-api-key" : xApiKey},
    ).then((value){
      responseUpgrade = jsonDecode(value.body);
      CacheHelper.putData(key: 'isUpdate', value: responseUpgrade['found']);
      debugPrint(value.body);
    emit(HomeGetStoresSuccessState());
    }).catchError((error){
      debugPrint("forceUpgrade error is : $error");
    emit(HomeGetStoresFailedState());
    });  
  }

}
