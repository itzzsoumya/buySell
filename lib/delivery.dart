import 'package:buy_sell/limit.dart';
import 'package:buy_sell/stopLoss.dart';
import 'package:flutter/material.dart';

import 'market.dart';

const int _MARKET = 0;
const int _LIMIT = 1;
const int _STOPLOSS = 2;

class delivery extends StatefulWidget {
  const delivery({Key? key}) : super(key: key);

  @override
  State<delivery> createState() => _deliveryState();
}

class _deliveryState extends State<delivery> with SingleTickerProviderStateMixin{

  late TextEditingController _qtyController;
  late TextEditingController _q2tyController;
  late TextEditingController _q3tyController;
  late TextEditingController _q4tyController;

  late TabController _tabController;
  int selectedTabIndex = 0;

  int up=0;
  void increment(){
    setState(() {
      if(up>=0&&up<1000000) {
        up++;
      }
    });
    _qtyController.text = '$up';
  }

  int u=0;
  void p(){
    setState(() {
      if(u>=0&&u<1000000) {
        u++;
      }
    });
    _q2tyController.text = '$u';
  }

  int uu=0;
  void pp(){
    setState(() {
      if(uu>=0&&uu<1000000) {
        uu++;
      }
    });
    _q3tyController.text = '$uu';
  }

  int uuu=0;
  void ppp(){
    setState(() {
      if(uuu>=0&&uuu<1000000) {
        uuu++;
      }
    });
    _q4tyController.text = '$uuu';
  }


  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this)..addListener(() { 
      _handleTabController();
    });
    _qtyController = TextEditingController();
    _q2tyController = TextEditingController();
    _q3tyController = TextEditingController();
    _q4tyController = TextEditingController();
    super.initState();
  }
  
  _handleTabController(){
    if(!_tabController.indexIsChanging){
      setState(() {
        selectedTabIndex = _tabController.index;
      });
    }
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _q2tyController.dispose();
    _q3tyController.dispose();
    super.dispose();
  }

  void decrement(){
    setState(() {
      if(up>1) {
        up--;
      }
    });
    _qtyController.text = '$up';
  }

  void de(){
    setState(() {
      if(u>1) {
        u--;
      }
    });
    _q2tyController.text = '$u';
  }

  void dee(){
    setState(() {
      if(uu>1) {
        uu--;
      }
    });
    _q3tyController.text = '$uu';
  }

  void deee(){
    setState(() {
      if(uuu>1) {
        uuu--;
      }
    });
    _q4tyController.text = '$uuu';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.black87,
                  tabs: [
                    Tab(text: 'Market',),
                    Tab(text: 'Limit',),
                    Tab(text: 'Stop Loss',),
                  ],
                ),
              ),
            ),
            Visibility(visible: selectedTabIndex == _STOPLOSS,
              child: Column(children: [
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _qtyController,
                        decoration: InputDecoration(
                          labelText: "Quantity",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusColor: Colors.black87,
                          suffixIcon: InkWell( onTap: () {
                            increment();
                          }, child: Icon(Icons.add_circle_outline)),
                          suffixIconColor: Colors.grey,
                          prefixIcon:InkWell( onTap: () {
                            decrement();
                          }, child: Icon(Icons.remove_circle_outline)),
                          prefixIconColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 14,),

                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _q2tyController,
                        decoration: InputDecoration(
                          labelText: "Price",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusColor: Colors.black87,
                          suffixIcon: InkWell( onTap: () {
                            p();
                          }, child: Icon(Icons.add_circle_outline)),
                          suffixIconColor: Colors.grey,
                          prefixIcon:InkWell( onTap: () {
                            de();
                          }, child: Icon(Icons.remove_circle_outline)),
                          prefixIconColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _q3tyController,
                        decoration: InputDecoration(
                          labelText: "Disclosequantity",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusColor: Colors.black87,
                          suffixIcon: InkWell( onTap: () {
                            //increment();
                            pp();
                          }, child: Icon(Icons.add_circle_outline)),
                          suffixIconColor: Colors.grey,
                          prefixIcon:InkWell( onTap: () {
                            //decrement();
                            dee();
                          }, child: Icon(Icons.remove_circle_outline)),
                          prefixIconColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 14),

                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _q4tyController,
                        decoration: InputDecoration(
                          labelText: "Triggerprice",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusColor: Colors.black87,
                          suffixIcon: InkWell( onTap: () {
                            //increment();
                            ppp();
                          }, child: Icon(Icons.add_circle_outline)),
                          suffixIconColor: Colors.grey,
                          prefixIcon:InkWell( onTap: () {
                            //decrement();
                            deee();
                          }, child: Icon(Icons.remove_circle_outline)),
                          prefixIconColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 8, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('Depth', style: TextStyle(fontSize: 16, color: Colors.teal),),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                ),


                Expanded(child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        // Navigator.pop(context);
                      },
                      child: Container(
                        width: 50,
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 0, left: 5),
                        //padding: EdgeInsets.all(dimen_10),
                        //height: dimen_20,
                        constraints: const BoxConstraints(
                          maxHeight: 28,
                          maxWidth: 26,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(50),),
                        ),
                        child: Image.asset('images/down-arrow.png'),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(bottom: 0, left: 0,),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.6*0.4,
                          child: Text( 'Show options',style: TextStyle(color: Colors.black87, fontSize: 15, fontFamily: 'Inter'), textAlign: TextAlign.center,)
                      ),
                    ),
                  ],
                ),
                ),

                Expanded(child: Container(
                  height: 2,
                  color: Colors.grey,

                ),
                ),
              ],
            ),
            ],
              ),
        ],
            ),
            ),
        Visibility(visible: selectedTabIndex == _LIMIT,
          child:Column(children: [
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: TextField(
                    controller: _qtyController,
                    decoration: InputDecoration(
                      labelText: "Quantity",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusColor: Colors.black87,
                      suffixIcon: InkWell( onTap: () {
                        increment();
                      }, child: Icon(Icons.add_circle_outline)),
                      suffixIconColor: Colors.grey,
                      prefixIcon:InkWell( onTap: () {
                        decrement();
                      }, child: Icon(Icons.remove_circle_outline)),
                      prefixIconColor: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14,),

              Expanded(
                child: Container(
                  child: TextField(
                    controller: _q2tyController,
                    decoration: InputDecoration(
                      labelText: "Price",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusColor: Colors.black87,
                      suffixIcon: InkWell( onTap: () {
                        p();
                      }, child: Icon(Icons.add_circle_outline)),
                      suffixIconColor: Colors.grey,
                      prefixIcon:InkWell( onTap: () {
                        de();
                      }, child: Icon(Icons.remove_circle_outline)),
                      prefixIconColor: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ) ,
            SizedBox(height: 14,),
            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 8, 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(

                          child: TextField(
                            controller: _q3tyController,
                            decoration: InputDecoration(
                              labelText: "Disclosequantity",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusColor: Colors.black87,
                              suffixIcon: InkWell( onTap: () {
                                pp();
                              }, child: Icon(Icons.add_circle_outline)),
                              suffixIconColor: Colors.grey,
                              prefixIcon:InkWell( onTap: () {
                                dee();
                              }, child: Icon(Icons.remove_circle_outline)),
                              prefixIconColor: Colors.grey,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 150,),

                      Text('Depth', style: TextStyle(fontSize: 16, color: Colors.teal),),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    ),


                    Expanded(child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: 50,
                            height: 40,
                            margin: const EdgeInsets.only(bottom: 0, left: 5),
                            //padding: EdgeInsets.all(dimen_10),
                            //height: dimen_20,
                            constraints: const BoxConstraints(
                              maxHeight: 28,
                              maxWidth: 26,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.all(Radius.circular(50),),
                            ),
                            child: Image.asset('images/down-arrow.png'),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(bottom: 0, left: 0,),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.6*0.4,
                              child: Text( 'Show options',style: TextStyle(color: Colors.black87, fontSize: 15, fontFamily: 'Inter'), textAlign: TextAlign.center,)
                          ),
                        ),
                      ],
                    ),
                    ),

                    Expanded(child: Container(
                      height: 2,
                      color: Colors.grey,

                    ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),

            Visibility(visible: selectedTabIndex == _MARKET,
              child:Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: TextField(
                            controller: _qtyController,
                            decoration: InputDecoration(
                              labelText: "Quantity",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusColor: Colors.black87,
                              suffixIcon: InkWell( onTap: () {
                                increment();
                              }, child: Icon(Icons.add_circle_outline)),
                              suffixIconColor: Colors.grey,
                              prefixIcon:InkWell( onTap: () {
                                decrement();
                              }, child: Icon(Icons.remove_circle_outline)),
                              prefixIconColor: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 14,),

                      Expanded(
                        child: Container(
                          child: TextField(
                            controller: _q2tyController,
                            decoration: InputDecoration(
                              labelText: "Price",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusColor: Colors.black87,
                              suffixIcon: InkWell( onTap: () {
                                p();
                              }, child: Icon(Icons.add_circle_outline)),
                              suffixIconColor: Colors.grey,
                              prefixIcon:InkWell( onTap: () {
                                de();
                              }, child: Icon(Icons.remove_circle_outline)),
                              prefixIconColor: Colors.grey,
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ) ,





                Row(
                  children: [
                    Expanded(child: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    ),


                    Expanded(child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: 50,
                            height: 40,
                            margin: const EdgeInsets.only(bottom: 0, left: 5),
                            //padding: EdgeInsets.all(dimen_10),
                            //height: dimen_20,
                            constraints: const BoxConstraints(
                              maxHeight: 28,
                              maxWidth: 26,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.all(Radius.circular(50),),
                            ),
                            child: Image.asset('images/down-arrow.png'),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(bottom: 0, left: 0,),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.6*0.4,
                              child: Text( 'Show options',style: TextStyle(color: Colors.black87, fontSize: 15, fontFamily: 'Inter'), textAlign: TextAlign.center,)
                          ),
                        ),
                      ],
                    ),
                    ),

                    Expanded(child: Container(
                      height: 2,
                      color: Colors.grey,

                    ),
                    ),
                  ],
                )





    //     body: Padding(
    //     padding: EdgeInsets.all(10.0),
    //     child: Column(
    //     children: [
    //     Container(
    //     height: 40,
    //     decoration: BoxDecoration(color: Colors.grey[300],
    //     borderRadius: BorderRadius.circular(10.0),
    //     ),
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             FilledButton(onPressed: () {
    //
    //               Column(
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Expanded(
    //                           child: Container(
    //                             child: TextField(
    //                               controller: _qtyController,
    //                               decoration: InputDecoration(
    //                                 labelText: "Quantity",
    //                                 border: OutlineInputBorder(
    //                                   borderRadius: BorderRadius.circular(20.0),
    //                                 ),
    //                                 focusColor: Colors.black87,
    //                                 suffixIcon: InkWell( onTap: () {
    //                                   increment();
    //                                 }, child: Icon(Icons.add_circle_outline)),
    //                                 suffixIconColor: Colors.grey,
    //                                 prefixIcon:InkWell( onTap: () {
    //                                   decrement();
    //                                 }, child: Icon(Icons.remove_circle_outline)),
    //                                 prefixIconColor: Colors.grey,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(width: 14,),
    //
    //                         Expanded(
    //                           child: Container(
    //                             child: TextField(
    //                               controller: _q2tyController,
    //                               decoration: InputDecoration(
    //                                 labelText: "Price",
    //                                 border: OutlineInputBorder(
    //                                   borderRadius: BorderRadius.circular(20.0),
    //                                 ),
    //                                 focusColor: Colors.black87,
    //                                 suffixIcon: InkWell( onTap: () {
    //                                   p();
    //                                 }, child: Icon(Icons.add_circle_outline)),
    //                                 suffixIconColor: Colors.grey,
    //                                 prefixIcon:InkWell( onTap: () {
    //                                   de();
    //                                 }, child: Icon(Icons.remove_circle_outline)),
    //                                 prefixIconColor: Colors.grey,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Column(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Expanded(
    //                               child: Container(
    //                                 child: TextField(
    //                                   controller: _q3tyController,
    //                                   decoration: InputDecoration(
    //                                     labelText: "Disclosequantity",
    //                                     border: OutlineInputBorder(
    //                                       borderRadius: BorderRadius.circular(20.0),
    //                                     ),
    //                                     focusColor: Colors.black87,
    //                                     suffixIcon: InkWell( onTap: () {
    //                                       //increment();
    //                                       pp();
    //                                     }, child: Icon(Icons.add_circle_outline)),
    //                                     suffixIconColor: Colors.grey,
    //                                     prefixIcon:InkWell( onTap: () {
    //                                       //decrement();
    //                                       dee();
    //                                     }, child: Icon(Icons.remove_circle_outline)),
    //                                     prefixIconColor: Colors.grey,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             SizedBox(width: 14,),
    //
    //                             Expanded(
    //                               child: Container(
    //                                 child: TextField(
    //                                   controller: _q4tyController,
    //                                   decoration: InputDecoration(
    //                                     labelText: "Triggerprice",
    //                                     border: OutlineInputBorder(
    //                                       borderRadius: BorderRadius.circular(20.0),
    //                                     ),
    //                                     focusColor: Colors.black87,
    //                                     suffixIcon: InkWell( onTap: () {
    //                                       //increment();
    //                                       ppp();
    //                                     }, child: Icon(Icons.add_circle_outline)),
    //                                     suffixIconColor: Colors.grey,
    //                                     prefixIcon:InkWell( onTap: () {
    //                                       //decrement();
    //                                       deee();
    //                                     }, child: Icon(Icons.remove_circle_outline)),
    //                                     prefixIconColor: Colors.grey,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Column(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.fromLTRB(0, 12, 8, 30),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.end,
    //                           children: const [
    //                             Text('Depth', style: TextStyle(fontSize: 16, color: Colors.teal),),
    //                           ],
    //                         ),
    //                       ),
    //                       Row(
    //                         children: [
    //                           Expanded(child: Container(
    //                             height: 2,
    //                             color: Colors.grey,
    //                           ),
    //                           ),
    //
    //
    //                           Expanded(child: Row(
    //                             children: [
    //                               InkWell(
    //                                 onTap: (){
    //                                   // Navigator.pop(context);
    //                                 },
    //                                 child: Container(
    //                                   width: 50,
    //                                   height: 40,
    //                                   margin: const EdgeInsets.only(bottom: 0, left: 5),
    //                                   constraints: const BoxConstraints(
    //                                     maxHeight: 28,
    //                                     maxWidth: 26,
    //                                   ),
    //                                   decoration: BoxDecoration(
    //                                     color: Colors.blueGrey.shade100,
    //                                     borderRadius: BorderRadius.all(Radius.circular(50),),
    //                                   ),
    //                                   child: Image.asset('images/down-arrow.png'),
    //                                 ),
    //                               ),
    //                               Padding(padding: const EdgeInsets.only(bottom: 0, left: 0,),
    //                                 child: SizedBox(
    //                                     width: MediaQuery.of(context).size.width*0.6*0.4,
    //                                     child: Text( 'Show options',style: TextStyle(color: Colors.black87, fontSize: 15, fontFamily: 'Inter'), textAlign: TextAlign.center,)
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           ),
    //
    //                           Expanded(child: Container(
    //                             height: 2,
    //                             color: Colors.grey,
    //
    //                           ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               );
    //
    //             },
    //                 child: Text('Market'),
    //             ),
    //
    //             FilledButton(onPressed: () { },
    //                 child: Text('Limit'),
    //             ),
    //
    //             FilledButton(onPressed: () { },
    //                 child: Text('Stop Loss'),
    //             ),
    //           ],
    //         ),
    //       ),
    //
    //
    //   ),
    // ],
    // ),
    // ),
      ],
    ),
      ),
        ],
    ),
      ),
    );
  }
}
