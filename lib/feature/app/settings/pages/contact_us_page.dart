import 'package:flutter/material.dart';
import 'package:pp_14_copy/common/components/fields/email_fields.dart';
import 'package:pp_14_copy/common/components/fields/text_fields.dart';
import 'package:pp_14_copy/common/helpers/email_helper.dart';
import 'package:pp_14_copy/common/styles/const_theme/size.dart';

class ContactUsPageWidget extends StatefulWidget {
  const ContactUsPageWidget({super.key});

  @override
  State<ContactUsPageWidget> createState() => _ContactUsPageWidgetState();
}

class _ContactUsPageWidgetState extends State<ContactUsPageWidget> {
  late TextEditingController messageTextController;
  late TextEditingController messageSubjectController;
  late TextEditingController mailController;
  bool isFormValid = false;
  late GlobalKey<FormState> contactUsPageFormKey;

  @override
  void initState() {
    messageTextController = TextEditingController();
    messageSubjectController = TextEditingController();
    mailController = TextEditingController();
    contactUsPageFormKey = GlobalKey<FormState>();

    super.initState();
  }

  final _messageContoller = TextEditingController();

  var isButtonEnabled = false;

  void _onChanged(String value) {
    EmailHelper.launchEmailSubmission(
      toEmail: 'Qasim8262922@gmail.com',
      subject: 'Connect with support',
      body: _messageContoller.text,
      errorCallback: () {},
      doneCallback: () => setState(
        () {
          _messageContoller.clear();
          isButtonEnabled = false;
        },
      ),
    );
  }

  @override
  void dispose() {
    messageSubjectController.dispose();
    messageTextController.dispose();
    mailController.dispose();
    _messageContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  isFormValid = contactUsPageFormKey.currentState!.validate();
                });

                if (isFormValid) {
                  _onChanged(
                      "message: ${messageTextController.text}, mail: ${mailController.text}, messageSubject: ${messageSubjectController.text}");
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Send',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: SizeConfig.marginHoriontal,
            right: SizeConfig.marginHoriontal,
          ),
          child: Form(
            key: contactUsPageFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NamesFieldWidget(
                    controller: messageSubjectController,
                    titleHint: 'Message subject'),
                const SizedBox(height: 10),
                EmailField(
                  controller: mailController,
                  titleHint: 'Mail',
                ),
                const SizedBox(height: 10),
                NamesFieldWidget(
                    controller: messageTextController,
                    titleHint: 'Message text')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
