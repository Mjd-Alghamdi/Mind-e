import 'package:alert_banner/types/enums.dart';
import 'package:alert_banner/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/widgets/alert_banner_widget.dart';
import 'package:mind_e/widgets/buttons/custom_button.dart';
import 'package:mind_e/widgets/popups/emotion_category_widget.dart';
import 'package:mind_e/widgets/popups/feeling_textfield_widget.dart';

class AddFeelingPopupWidget extends StatefulWidget {
  const AddFeelingPopupWidget({
    super.key,
  });

  @override
  State<AddFeelingPopupWidget> createState() => _AddFeelingPopupWidgetState();
}

class _AddFeelingPopupWidgetState extends State<AddFeelingPopupWidget> {
  TextEditingController feelingContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeelingRecordBloc>();
    return BlocListener<FeelingRecordBloc, FeelingRecordState>(
      listener: (context, state) {
        if (state is ErrorState) {
          showAlertBanner(
            context,
            () => (),
            durationOfStayingOnScreen: const Duration(milliseconds: 900),
            AlertBannerWidget(msg: state.errorMsg),
            alertBannerLocation: AlertBannerLocation.top,
          );
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "How do you feel tody? *",
                  style: TextStyle(
                    color: greyBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                kV4,
                FeelingTextfieldWidget(
                  controller: feelingContentController,
                ),
                kV24,
                const Text(
                  "Categorize this feelings *",
                  style: TextStyle(
                    color: greyBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                kV12,
                const EmotionCategoryWidget(),
                kV42,
                CustomButton(
                  onTap: () {
                    //-- Add the feeling to the list
                    bloc.add(AddNewFeelingEvent(
                      content: feelingContentController.text,
                    ));

                    // -- Pop up the view
                    feelingContentController.text.trim().isNotEmpty &&
                            bloc.selectedEmotion.isNotEmpty
                        ? Navigator.pop(context)
                        : null;
                  },
                  buttonTitle: 'Welcome it',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
