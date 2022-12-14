import 'package:flutter/material.dart';
 class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
   int count=1;

  @override
  Widget build(BuildContext context) {
      return     Container(
                                height: 24,
                                      width:  50,
                                       color: Colors.black,
                                         decoration: BoxDecoration(
                                            
                                            borderRadius: BorderRadius.circular(8),
                                             border: Border.all(
                                               color: Colors.grey
                                             ),
                                        ),
                                         child: Row(
                                          //  crossAxisAlignment: CrossAxisAlignment.start,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                           Icon(Icons.remove , color: Colors.yellow[500],),
                                            Text("1",style: TextStyle(fontWeight: FontWeight.bold),),

                                             Icon(Icons.add,size: 20,color: Colors.yellow[500],)
                                         ]),
                                   );
  }
}