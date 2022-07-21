import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_api/Bloc/cubit.dart';
import 'package:music_api/Bloc/state.dart';
import 'package:music_api/Shared/remote/dio_helper.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getAllTracks(),
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state) {},
        builder: (context , state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: const Text(
                'Music List',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context ,index) => listItem(AppCubit.get(context).tracksNames[index], AppCubit.get(context).tracksIds[index]),
                separatorBuilder: (context ,index) => const SizedBox(
                  height: 5,
                ),
                itemCount: AppCubit.get(context).tracksNames.length,
            ),
          );
        },
      ),
    );
  }


  Widget listItem (String name , int id)
  {
    return InkWell(
      onTap: (){
        print('music id : ${id}');
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 80,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.orange,
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
  
}
