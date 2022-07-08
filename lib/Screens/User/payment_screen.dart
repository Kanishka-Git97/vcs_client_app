import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vcs_client_app/Components/back_arrow.dart';
import 'package:vcs_client_app/Components/custom_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BackArrow(onPress: () {}),
                const Padding(
                  padding: EdgeInsets.only(top: 52, left: 25),
                  child: Text(
                    'Review Appointment',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    height: 60,
                    width: double.infinity - 50,
                    //color: Colors.grey,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Monday, 25 of July',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    height: 80,
                    width: double.infinity - 50,
                    //color: Colors.grey,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Veterinary',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Sandini Kaveesha',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text('Doctor')
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://www.pngkit.com/png/detail/10-100458_female-doctor-png-picture-indian-lady-doctor-png.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    height: 70,
                    width: double.infinity - 50,
                    //color: Colors.grey,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Location',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Suzy Queue 4455 Landing Lange, APT 4 Louisville, KY 40018-1234',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    height: 80,
                    width: double.infinity - 50,
                    //color: Colors.grey,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Payment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                          height: 50,
                          child:
                              Image(image: AssetImage('assets/images/R.png')),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    height: 150,
                    width: double.infinity - 50,
                    //color: Colors.grey,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Fee',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Rs. 3500.00',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Consultation Fee'),
                                Text('Rs. 1000.00')
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Treatment Fee'),
                                Text('Rs. 1500.00')
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Total Fee'),
                                Text('Rs. 3500.00')
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      height: 50,
                      btnColor: Colors.green,
                      fontColor: Colors.white,
                      fontSize: 18,
                      btnText: 'Continue & Pay',
                      onPress: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
