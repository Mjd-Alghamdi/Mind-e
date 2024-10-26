import 'package:alert_banner/types/enums.dart';
import 'package:alert_banner/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/views/home_view.dart';
import 'package:mind_e/widgets/alert_banner_widget.dart';
import 'package:mind_e/widgets/buttons/custom_button.dart';

class NameBoxWidget extends StatefulWidget {
  const NameBoxWidget({
    super.key,
  });

  @override
  State<NameBoxWidget> createState() => _NameBoxWidgetState();
}

class _NameBoxWidgetState extends State<NameBoxWidget> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeelingRecordBloc>();
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: greyBlackColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What is your name?",
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          kV12,
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: whiteColor,
              hintText: "ex. Sara",
              border: OutlineInputBorder(),
            ),
          ),
          kV24,
          BlocListener<FeelingRecordBloc, FeelingRecordState>(
            listener: (context, state) {
              if (state is ErrorState) {
                showAlertBanner(
                  context,
                  () => (),
                  durationOfStayingOnScreen: const Duration(milliseconds: 900),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: AlertBannerWidget(msg: state.errorMsg),
                  ),
                  alertBannerLocation: AlertBannerLocation.top,
                );
              }
            },
            child: CustomButton(
              onTap: () {
                bloc.add(TakeUserNameEvent(nameController.text));
                if (nameController.text.trim().isNotEmpty) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                }
              },
              buttonTitle: "START",
              buttonColor: limColor,
              titleColor: greyBlackColor,
            ),
          )
        ],
      ),
    );
  }
}
