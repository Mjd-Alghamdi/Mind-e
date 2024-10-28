import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';
import 'package:mind_e/constants/color.dart';
import 'package:shimmer/shimmer.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeelingRecordBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: greyBlackColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Shimmer.fromColors(
            baseColor: greyColor,
            highlightColor: whiteColor,
            period: const Duration(milliseconds: 1500),
            child: const Text(
              "For you",
              textAlign: TextAlign.center,
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        BlocBuilder<FeelingRecordBloc, FeelingRecordState>(
          builder: (context, state) {
            if (state is ShowFeelingListState) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  bloc.recordData.mostFeeling,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
