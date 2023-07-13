import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextStyle txt=const TextStyle(fontSize: 20,color: Colors.white);
  String DD = "00", MM = "00", YYYY = "0000";
  int presentyear = 00,
      presentmonty = 00,
      presentday = 00,
      nMonty = 0,
      nday = 0;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('d,MMM,y').format(currentDate);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Age calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Today's Date"),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: h / 16,
                      width: w,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        formattedDate,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                )),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Date of Birth",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 0)),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: h / 18,
                            width: w / 3,
                            child: Align(
                              child: TextField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                controller: t1,
                                onChanged: (d) {
                                  DD = d;
                                  print("$DD");
                                },
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    hintText: "DD",
                                    border: OutlineInputBorder()),
                              ),
                            ),
                          )),
                      const Padding(padding: EdgeInsets.only(right: 5)),
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: h / 18,
                            width: w / 3,
                            child: Align(
                              child: TextField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                controller: t2,
                                onChanged: (m) {
                                  MM = m;
                                  print("$MM");
                                },
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    hintText: "MM",
                                    border: OutlineInputBorder()),
                              ),
                            ),
                          )),
                      const Padding(padding: EdgeInsets.only(right: 5)),
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: h / 18,
                            width: w / 3,
                            child: Align(
                              child: TextField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                controller: t3,
                                onChanged: (y) {
                                  YYYY = y;
                                  print("$YYYY");
                                },
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    hintText: "YYYY",
                                    border: OutlineInputBorder()),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(right: 35)),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          t1.clear();
                          t2.clear();
                          t3.clear();

                        });


                      },
                      child: Container(
                        height: h / 16,
                        width: w / 2,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xff13547A)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Align(
                          child: Text("clear"),
                        ),
                      ),
                    )),
                    const Padding(padding: EdgeInsets.only(right: 5)),
                    Expanded(
                        child: InkWell(
                      onTap: () {

                        setState(() {
                          presentmonty = currentDate.month - int.parse(MM);
                          presentyear = currentDate.month < int.parse(MM)
                              ? (currentDate.year - int.parse(YYYY)) - 1
                              : (currentDate.year - int.parse(YYYY));
                          presentday = 30 - int.parse(DD);
                          nMonty = int.parse(MM) - currentDate.month;
                          nday = currentDate.day - int.parse(DD);
                        });
                      },
                      child: Container(
                        height: h / 16,
                        width: w / 2,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xff13547A)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Align(
                          child: Text("calculate"),
                        ),
                      ),
                    )),
                  ],
                )
              ],
            )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Present Age",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            color: Colors.black),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Container(
                      height: h / 10,
                      width: w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.green, Colors.red])),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                              Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                                Text("$presentyear",style: txt,),
                                Text("Year",style: txt,),

                              ],),
                          Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                            Text("$presentmonty",style: txt,),
                            Text("MM",style: txt,),

                          ],),
                          Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                            Text("$presentday",style: txt,),
                            Text("DD",style: txt,),

                          ],),
                      ],),
                    ),


                  ],
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Next Birthday",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            color: Colors.black),
                      ),
                    ),

                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Container(
                      height: h / 10,
                      width: w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.green, Colors.red])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                            Text("$nMonty",style: txt,),
                            Text("MM",style: txt,),

                          ],),
                          Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                            Text("$nday",style: txt,),
                            Text("DD",style: txt,),

                          ],),
                         
                        ],),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
