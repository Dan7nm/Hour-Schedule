import 'package:flutter/material.dart';

class NewPerson extends StatefulWidget {
  final Function addTx;

  NewPerson(this.addTx);

  @override
  _NewPersonState createState() => _NewPersonState();
}

class _NewPersonState extends State<NewPerson> {
  final _nameController = TextEditingController();

  void _submitData() {
    final name = _nameController.text;

    widget.addTx(name);

    Navigator.of(context).pop();
    
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: _nameController,
              onSubmitted: (_) => _submitData(),
            ),
            RaisedButton(
              child: Text('Add Person'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
