
import 'package:donation/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.amount,
    required this.address,
    required this.phone,
    required this.donor,
    required this.user,
    required this.createdAt,
    super.key,
  });

  final String amount;
  final String address;
  final String phone;
  final String donor;
  final String user;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(title: amount,fontColor: Colors.white,fontFamily:'RobotoMono' ,),
            ],
          ),
          const SizedBox(height: 10),
           Row(
            mainAxisAlignment: MainAxisAlignment.end, // Align to the right
            children: [
              CustomText(title: address,fontColor: Colors.white,fontFamily:'RobotoMono',fontSize: 12),
            ],
          ),
          const SizedBox(height: 10),
           Row(
            mainAxisAlignment: MainAxisAlignment.end, // Align to the right
            children: [
              CustomText(title: phone,fontColor: Colors.white,fontFamily:'RobotoMono',fontSize: 12),
            ],
          ),
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: donor,fontColor: Colors.white,fontFamily:'RobotoMono',fontSize: 18),
                  const SizedBox(height: 5),
                  CustomText(title: "$user $createdAt",fontColor: Colors.white,fontFamily:'RobotoMono',fontSize: 12),
                ],
              ),
              SizedBox(
                width: 60,
                height: 40,
                child: Image.asset(
                  'assets/mastercard.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
