import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeelingRecordBloc>();
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundColor: greyBlackColor,
          child: Icon(
            Icons.person,
            color: whiteColor,
          ),
        ),
        kH12,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome agin",
              style: TextStyle(
                color: greyColor,
                fontSize: 15,
              ),
            ),
            Text(
              bloc.userData.userName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
