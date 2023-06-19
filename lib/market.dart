import 'package:flutter/material.dart';

class market extends StatefulWidget {
  const market({Key? key}) : super(key: key);

  @override
  State<market> createState() => _marketState();
}

class _marketState extends State<market> {
  late TextEditingController _qtyController;

  int up=0;
  void increment(){
    setState(() {
      if(up>=0&&up<1000000) {
        up++;
      }
    });
    _qtyController.text = '$up';
  }

  @override
  void initState() {
    _qtyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _qtyController.dispose();
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                      decoration: InputDecoration(
                        labelText: "Price",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: Icon(Icons.lock),
                        suffixIconColor: Colors.grey,
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
              )
            ],
          )
        ],

      ),
    );
  }
}
