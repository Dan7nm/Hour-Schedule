import 'package:flutter/material.dart';
import 'package:zakif_yomi3/NewPerson.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakif_yomi3/PersonCheck.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<String> lastList;
  MyHomePage({Key key, this.title, this.lastList}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> people = [];

  void initState() {
    super.initState();
    if (widget.lastList!=null) {
      _saveLast();
    }
    _loadPeople();
  }

  void _saveLast() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      people = widget.lastList;
      prefs.setStringList('list', people);
    });
  }

  void _loadPeople() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      people = (prefs.getStringList('list') ?? 0);
    });
  }

  void _addNewPerson(name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //people=(prefs.getStringList('list')??0);
      people.add(name);
      prefs.setStringList('list', people);
    });
  }

  void _startAddNewPerson(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewPerson(_addNewPerson),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deletePerson(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      people.removeAt(value);
      prefs.setStringList('list', people);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'זקיפות קודמת',
          style: TextStyle(fontSize: 30),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewPerson(context),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: this.people.length,
        itemBuilder: (context, value) {
          return Card(
            color: Colors.amberAccent[200],
            elevation: 3,
            child: Container(
              child: ListTile(
                leading: Text('${value + 1}'),
                title: Text(
                  people[value],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deletePerson(value);
                  },
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
              builder: (context) => PersonCheck(peopleCheck: people),
            ),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
/*


 




for(int i=0;i<people.length;i++){
      print(people[i]);
  }



  */
