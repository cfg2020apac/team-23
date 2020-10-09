import 'package:flutter/material.dart';

class WishForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Wish Title'),
                // onChanged: (val) {
                //   titleInput = val;
                // },
                // controller: titleController,
                // onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Wish description'),
                // onChanged: (val) => amountInput = val),
                // controller: amountController,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                // onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Points'),
                // onChanged: (val) => amountInput = val),
                // controller: amountController,
                keyboardType: TextInputType.number,
                // onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 80,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                          // _enteredDate == null
                          'No Date Chosen!!'
                          // : 'Picked Date: ${DateFormat.yMd().format(_enteredDate)}',
                          ),
                    ),
                    FlatButton(
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
