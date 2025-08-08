import 'package:ayurved/core/constants/text_const.dart';
import 'package:ayurved/core/widgets/textfield.dart';
import 'package:ayurved/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyUserBooking extends StatefulWidget {
  const MyUserBooking({super.key});

  @override
  State<MyUserBooking> createState() => _MyUserBookingState();
}

TextEditingController fullNameController = TextEditingController();
TextEditingController watsappController = TextEditingController();
TextEditingController locationController = TextEditingController();
TextEditingController addressController = TextEditingController();

class _MyUserBookingState extends State<MyUserBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.notifications_none_sharp, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(text: 'Name'),
            textfield(text: TextConst.fullName, controller: fullNameController),
            const SizedBox(height: 10),
            text(text: 'Watsapp Number'),
            textfield(
              text: TextConst.watsappField,
              controller: watsappController,
            ),
            const SizedBox(height: 10),
            text(text: 'Address'),
            textfield(
              text: TextConst.enetrAddress,
              controller: addressController,
            ),
            const SizedBox(height: 10),
            text(text: 'Location'),
            textfield(
              text: TextConst.selectLocation,
              controller: locationController,
            ),
          ],
        ),
      ),
    );
  }


}
