import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/widgets/home%20view%20widgets/custom_appbar_widget.dart';
import 'package:mind_e/widgets/home%20view%20widgets/custom_placeholder.dart';
import 'package:mind_e/widgets/home%20view%20widgets/feeling_card_widget.dart';
import 'package:mind_e/widgets/home%20view%20widgets/filter_widget.dart';
import 'package:mind_e/widgets/home%20view%20widgets/floating_action_button_widget.dart';
import 'package:mind_e/widgets/home%20view%20widgets/for_you_widget.dart';
import 'package:mind_e/widgets/popups/add_feeling_popup_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Reading the bloc as a short cut to easy use
    final bloc = context.read<FeelingRecordBloc>();

    // Adding the fetching list function initially
    bloc.add(DisplayFeelingListEvent());
    return Scaffold(
      backgroundColor: lightLimColor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          top: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBarWidget(),
            kV42,
            const ForYouWidget(),
            kV42,
            const FilterWidget(),
            kV24,
            Expanded(
              child: BlocBuilder<FeelingRecordBloc, FeelingRecordState>(
                builder: (context, state) {
                  if (state is ShowFeelingListState) {
                    return state.recordList.isEmpty
                        ? const CustomPlaceholder()
                        : ListView.builder(
                            itemCount: state.recordList.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) {
                              return FeelingCardWidget(
                                feelingRecord: state.recordList[index],
                              );
                            },
                          );
                  } else {
                    return Container(
                      color: lightLimColor,
                      child: const Text("Something went wrong!"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AddFeelingPopupWidget();
            },
          );
        },
        child: const FloatingActionButtonWidget(),
      ),
    );
  }
}
