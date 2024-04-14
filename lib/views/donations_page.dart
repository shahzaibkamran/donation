import 'package:donation/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class DonationsPage extends StatelessWidget {
  const DonationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donations'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding:  EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: CardWidget(
                  amount: "100000",
                  address: "190 A Dream Avenue Raiwind Road",
                  phone: "+923202434372",
                  user: "Abdullah Islam",
                  donor: "Shahzaib Kamran",
                  createdAt: "19/02/2024",
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: CardWidget(
                  amount: "50000",
                  address: "45/1 G Phase 5 DHA",
                  phone: "+923202434372",
                  user: "Abdullah Islam",
                  donor: "Shahzaib K",
                  createdAt: "19/02/2024",
                ),
              ),
              // Add more CardWidgets here if needed
            ],
          ),
        ),
      ),
    );
  }
}
