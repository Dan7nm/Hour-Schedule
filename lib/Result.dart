import 'package:flutter/material.dart';
import 'package:zakif_yomi3/main.dart';

class Result extends StatelessWidget {
  List<String> people1;
  List<bool> peoplePres;
  Result({this.people1, this.peoplePres});

  @override
  Widget build(BuildContext context) {
    int count = 0; //count for how many people are here
    int count2 = 1; //count for the new order

    List<int> people5 = [2000, 2225, 0050, 0315, 0540];
    List<int> people6 = [2000, 2200, 0000, 0200, 0400, 0600];
    List<int> people7 = [2000, 2145, 2330, 0115, 0255, 0435, 0615];
    List<int> people8 = [2000, 2130, 2300, 0030, 0200, 0330, 0500, 0630];
    List<int> people9 = [2000, 2120, 2240, 0000, 0120, 0240, 0400, 0520, 0640];
    List<int> people10 = [
      2000,
      2120,
      2230,
      2340,
      0050,
      0200,
      0310,
      0420,
      0530,
      0640
    ];
    List<int> people11 = [
      2000,
      2105,
      2210,
      2315,
      0020,
      0125,
      0230,
      0335,
      0440,
      0545,
      0650
    ];
    List<int> people12 = [
      2000,
      2100,
      2200,
      2300,
      0000,
      0100,
      0200,
      0300,
      0400,
      0500,
      0600,
      0700
    ];

    List<int> list1 = new List(people1.length); //List with the algorithm
    List<int> list2 = new List(people1.length); //List with the new order

    List<int> list5 = new List(people1.length);
    for (int i = 0; i < people1.length; i++) {
      //counting People that are here
      if (peoplePres[i] == true) {
        count++;
      }
    }
    if (count == people1.length) {
      count2 = 0;
    }

    for (int i = 0; i < people1.length; i++) {
      // Declaring a list which will be the index for the next Zkifut
      list1[i] = i;
    }

    for (int i = 0; i < people1.length; i++) {
      //Applying the algorithm
      int num1 = count ~/ 3;
      if (count % 3 == 2) {
        num1 += 1;
      }
      list1[i] = list1[i] + num1 - count;
    }

    for (int i = 0; i < people1.length; i++) {
      // making the new schedule for absent people but starting with 0
      if (peoplePres[i] == false) {
        list2[i] = 0;
        break;
      }
    }

    for (int i = 0; i < people1.length; i++) {
      // makeing the new schedule pos num
      if ((list1[i] >= 0) && (peoplePres[i] == true)) {
        list2[i] = count2;
        count2++;
      }
    }

    for (int i = 0; i < people1.length; i++) {
      // makeing the new schedule neg num
      if ((list1[i] < 0) && (peoplePres[i] == true)) {
        list2[i] = count2;
        count2++;
      }
    }
    for (int i = 0; i < people1.length; i++) {
      // makeing the new schedule for absent people
      if ((peoplePres[i] == false) && (list2[i]) != 0) {
        list2[i] = count2;
        count2++;
      }
    }
    int count3 = 0; // count for displaying
    List<String> list3 = new List(count); //list for displaying
    for (int i = 0; i < people1.length; i++) {
      if (peoplePres[list2[i]] == true) {
        list3[count3] = people1[list2[i]];
        count3++;
      }
    }
    List<String> list4 = new List(people1.length); //finished list for saving
    for (int i = 0; i < people1.length; i++) {
      list4[i] = people1[list2[i]];
    }

    if (count == 5) {
      list5 = people5;
    }
    if (count == 6) {
      list5 = people6;
    }
    if (count == 7) {
      list5 = people7;
    }
    if (count == 8) {
      list5 = people8;
    }

    if (count == 9) {
      list5 = people9;
    }
    if (count == 10) {
      list5 = people10;
    }
    if (count == 11) {
      list5 = people11;
    }
    if (count == 12) {
      list5 = people12;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'זקיפות להיום',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: ListView.builder(
          itemCount: count,
          itemBuilder: (context, value) {
            return Card(
              color: Colors.amberAccent[200],
              elevation: 3,
              child: Container(
                child: ListTile(
                  leading: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      list5[value].toString().padLeft(4, '0'),
                    ),
                  ),
                  title: Text(list3[value]
                      //people1[value],
                      ),
                ),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(
                lastList: list4,
              ),
            ),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

/*

void _loadLast(List<String> lastRes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('list', lastRes);
  }
    
    
for (int i = 0; i < people1.length; i++) {
      people1[i] = people1[list2[i]];
      people1[list2[i]] = people1[i];
    }




 ListView.builder(
          itemCount: count,
          itemBuilder: (context, value) {
            return Card(
              color: Colors.amberAccent[200],
              elevation: 3,
              child: Container(
                child: ListTile(
                  leading: Text('num'),
                  title: Text(
                    'data',
                  ),
                ),
              ),
            );
          }),





  ListView(
        children: <Widget>[
          
          for(int i=0;i<count;i++){
            
          }
            
          
        ],
      )



 List<int> list3 = []; //List which is used for postive number reallocation


 int count3 = 1; //count the positive number reallocation


 for (int i = 0; i < people1.length; i++) {
      //positive number reallocation
      if ((list1[i] >= 0) && (peoplePres[i] == true)) {
        list3[i] = list1[i];
        count3++;
      }
    }







  bool sorted = false; //bubble sort
    int temp;
    while (!sorted) {
      sorted = true;
      for (int i = 0; i < count3; i++) {
        //positive number reallocation part 2
        if (list3[i] < list3[i + 1]) {
          temp = list3[i];
          list3[i] = list3[i + 1];
          list3[i + 1] = temp;
          sorted = false;
        }
      }
    }
    for(int i=0;i<count3;i++){
      list2[list3[i]]=count2;
      count2++;
    }


  void initState() {
    _lastZakif();
  }

  void _lastZakif() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lastPres = (prefs.getStringList('lastPres') ?? 0);
  }







void _loadingNew() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lastPres = people1;
    await prefs.setStringList('lastPres', lastPres);
  }
*/
