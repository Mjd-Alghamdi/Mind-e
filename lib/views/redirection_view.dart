import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';
import 'package:mind_e/views/home_view.dart';
import 'package:mind_e/views/welcome_view.dart';

class RedirectionView extends StatelessWidget {
  const RedirectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeelingRecordBloc>();

    return BlocBuilder<FeelingRecordBloc, FeelingRecordState>(
      builder: (context, state) {
        if (bloc.userData.userName.isNotEmpty) {
          return const HomeView();
        } else {
          return const WelcomeView();
        }
      },
    );
  }
}
