import 'package:buy_sell/delivery.dart';
import 'package:buy_sell/intraday.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String? choice;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 50,
                                  height: 40,
                                  margin: const EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  //padding: EdgeInsets.all(dimen_10),
                                  //height: dimen_20,
                                  constraints: const BoxConstraints(
                                    maxHeight: 35,
                                    maxWidth: 35,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey.shade100,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Image.asset('images/back_arrow.png'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 15,
                                  left: 10,
                                ),
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.6 *
                                        0.52,
                                    child: const Text(
                                      'SBIN-EQ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Inter'),
                                      textAlign: TextAlign.start,
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    'NSE ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Inter'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Image.asset(
                                      'images/up-down.png',
                                      height: 16,
                                      width: 15,
                                    ),
                                  ),
                                  const Text(
                                    'Rs.505.20',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Inter'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "-4.95",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      " (-0.97%)",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Inter'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 0, 50, 0),
                          child: Row(
                            children: [
                              Radio(
                                  value: "Regular",
                                  groupValue: choice,
                                  onChanged: (value) {
                                    setState(() {
                                      choice = value.toString();
                                    });
                                  }),
                              const Text(
                                'Regular',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "GTT",
                                groupValue: choice,
                                onChanged: (value) {
                                  setState(() {
                                    choice = value.toString();
                                  });
                                }),
                            const Text(
                              'GTT',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                    const TabBar(
                        indicatorColor: Colors.black87,
                        labelColor: Colors.black87,
                        tabs: [
                          Tab(
                            text: ('Delivery'),
                          ),
                          Tab(
                            text: ('Intraday'),
                          ),
                        ]),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          delivery(),
                          intraday(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
