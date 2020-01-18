import 'package:flutter/material.dart';
import 'package:zakif_yomi3/Result.dart';

class PersonCheck extends StatefulWidget {
  final List<String> peopleCheck;

  PersonCheck({Key key, this.peopleCheck}) : super(key: key);
  //PersonCheck(this.peopleCheck);

  @override
  _PersonCheckState createState() => _PersonCheckState();
}

class _PersonCheckState extends State<PersonCheck> {
  List<bool> chk1;
  @override
  void initState() {
    super.initState();
    chk1 = List<bool>.filled(widget.peopleCheck.length, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'זקיפים נוכחים',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: ListView.builder(
        itemCount: this.widget.peopleCheck.length,
        itemBuilder: (context, value) {
          return Card(
            color: Colors.amberAccent[200],
            elevation: 3,
            child: Container(
              child: ListTile(
                leading: Text('${value+1}'),
                title: Text(
                  widget.peopleCheck[value],
                ),
                trailing: Checkbox(
                  value: chk1[value],
                  onChanged: (bool val) => setState(() => chk1[value] = val),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Result(
                people1: widget.peopleCheck,
                peoplePres: chk1,
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

 for (int i=0; i<widget.peopleCheck.length();i++){

  }

return Card(
            color: Colors.amberAccent[200],
            elevation: 3,
            child: Container(
              child: CheckboxListTile(
                title: Text(
                  widget.peopleCheck[value],
                ),
                value: false,//chk1[value],
                onChanged: (bool
                    val) {}, //(bool val) => setState(() => chk1[value] = val),
              ),
            ),
          );



*/
