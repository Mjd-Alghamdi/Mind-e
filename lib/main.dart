import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';
import 'package:mind_e/views/redirection_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeelingRecordBloc()..add(GetUsernameEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RedirectionView(),
      ),
    );
  }
}
