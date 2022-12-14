import 'package:flutter/material.dart';
import 'package:faq/faq.dart';
 class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            faqList(
              title: 'Expandable List demo',
              data: _generateData(),
            )
          ],
        ),
      ),
    );
  }
    List<List<String>> _generateData() {
    int numberOfGroups = 5;
    List<List<String>> results = <List<String>>[];
    for (int i = 0; i < numberOfGroups; i++) {
      // List<String> items = List<String>();
      // for (int j = 0; j < 1; j++) {
      //   items.add("Item $j in group $i");
      // }
      results.add([
        "Everything’s a widget in Flutter… so wouldn’t it be nice to know how to make your own? There are several methods to create custom widgets, but the most basic is to combine simple existing widgets into the more complex widget that you want. This is called composition."
      ]);
    }
    return results;
  }


}
