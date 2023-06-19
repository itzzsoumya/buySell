import 'package:flutter/material.dart';

class limit extends StatefulWidget {
  const limit({Key? key}) : super(key: key);

  @override
  State<limit> createState() => _limitState();
}

class _limitState extends State<limit> {
  late TextEditingController _qltyController;
  late TextEditingController _qtyController;
  late TextEditingController _qntyController;

  int up=0;
  void increment(){
    setState(() {
      if(up>=0&&up<1000000) {
        up++;
      }
    });
    _qltyController.text = '$up';

  }

  int pos=0;
  void upp(){
    setState(() {
      if(pos>=0&&pos<10000000){
        pos++;
      }
    });
    _qtyController.text = '$pos';
  }

  int p=0;
  void uppp(){
    setState(() {
      if(p>=0&&p<10000000){
        p++;
      }
    });
    _qntyController.text = '$p';
  }


  @override
  void initState() {
    _qltyController = TextEditingController();
    _qtyController = TextEditingController();
    _qntyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _qltyController.dispose();
    _qtyController.dispose();
    _qntyController.dispose();
    super.dispose();
  }

  void decrement(){
    setState(() {
      if(up>1) {
        up--;
      }
    });
    _qltyController.text = '$up';

  }

  void down(){
    setState(() {
      if(pos>1){
        pos--;
      }
    });
    _qtyController.text = '$pos';
  }

  void downn(){
    setState(() {
      if(p>1){
        p--;
      }
    });
    _qntyController.text = '$p';
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
                      controller: _qltyController,
                      decoration: InputDecoration(
                        labelText: "Quantity",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusColor: Colors.black87,
                        suffixIcon: InkWell( onTap: () {
                          increment();
                          //upp();
                        }, child: Icon(Icons.add_circle_outline)),
                        suffixIconColor: Colors.grey,
                        prefixIcon:InkWell( onTap: () {
                          decrement();
                          //down();
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
                      controller: _qntyController,
                      decoration: InputDecoration(
                        labelText: "Price",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusColor: Colors.black87,
                        suffixIcon: InkWell( onTap: () {
                          //increment();
                          uppp();
                        }, child: Icon(Icons.add_circle_outline)),
                        suffixIconColor: Colors.grey,
                        prefixIcon:InkWell( onTap: () {
                          //decrement();
                          downn();
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
                padding: const EdgeInsets.fromLTRB(6, 0, 8, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(

                        child: TextField(
                          controller: _qtyController,
                          decoration: InputDecoration(
                            labelText: "Disclosequantity",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusColor: Colors.black87,
                            suffixIcon: InkWell( onTap: () {
                               upp();
                            }, child: Icon(Icons.add_circle_outline)),
                            suffixIconColor: Colors.grey,
                            prefixIcon:InkWell( onTap: () {
                              down();
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
    );
  }
}
