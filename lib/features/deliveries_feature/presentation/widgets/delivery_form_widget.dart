import 'package:flutter/cupertino.dart';

import '../../../../compenent/presentation/widgets/text_form_fieldWidget.dart';

class DeliveryFormWidget extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  final GlobalKey<FormState>formKey;
  const DeliveryFormWidget({Key? key, required this.formKey, required this.name, required this.email, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormFieldWidget(label: 'Name', hint: 'Enter Delivery Name', validate: (String? val) {return val!.length<5?"must be more than 5 characters":null;}, textEditingController: name,),
          TextFormFieldWidget(label: 'Email', hint: 'Enter Delivery Email', validate: (String? val) {return val!.length<5?"must be more than 5 characters":null;}, textEditingController: email,),
          TextFormFieldWidget(label: 'Phone', hint: 'Enter Delivery Phone', validate: (String? val) {return val!.length<5?"must be more than 5 characters":null;}, textEditingController: phone,textInputType: TextInputType.phone,),
        ],
      ),
    );
  }
}
