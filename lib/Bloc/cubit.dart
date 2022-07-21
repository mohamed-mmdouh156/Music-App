import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_api/Bloc/state.dart';
import 'package:music_api/Shared/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<String> tracksNames = [];
  List<int> tracksIds = [];


  void getAllTracks ()
  {
    DioHelper.getDate(
        url: 'chart.tracks.get',
        query: {
          "apikey" : "2d782bc7a52a41ba2fc1ef05b9cf40d7",
        }).then((value) {

      Map model = jsonDecode(value.data);
      //print(model.toString());

      model['message']['body']['track_list'].forEach((element){

        print('track id : ${element['track']['track_id']} name : ${element['track']['track_name']}');

        tracksIds.add(element['track']['track_id']);
        tracksNames.add(element['track']['track_name']);
      });
      emit(GetAllTracksSuccessState());
    }).catchError((error){
      print('Error when get music list : ${error.toString()}');
      emit(GetAllTracksErrorState());
    });
  }


  void getTrackDetails ({required int id})
  {
    DioHelper.getDate(url: 'track.get' , query: {
      'track_id' : id,
      'apikey' : '2d782bc7a52a41ba2fc1ef05b9cf40d7',
    }).then((value) {

      emit(GetTrackDetailsSuccessState());
    }).catchError((error){
      print('Error when get track Details : ${error.toString()}');
      emit(GetTrackDetailsErrorState());
    });
  }

  void getTrackLyrics ({required int id})
  {
    DioHelper.getDate(url: 'track.lyrics.get' , query: {
      'track_id' : id,
      'apikey' : '2d782bc7a52a41ba2fc1ef05b9cf40d7',
    }).then((value) {

      emit(GetTrackLyricsSuccessState());
    }).catchError((error){
      print('Error when get track Lyrics : ${error.toString()}');
      emit(GetAllTrackLyricsErrorState());
    });
  }

}