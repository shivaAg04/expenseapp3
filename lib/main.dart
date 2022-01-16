import 'package:expense_app3/widgets/new_transaction.dart';
import 'package:expense_app3/widgets/transaction_list.dart';

import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';

void main() {
  runApp(Expense());
}

class Expense extends StatefulWidget {
  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Transaction> _userTranscations = [
    Transaction(id: 't1', title: 'shoes', amount: 567, date: DateTime.now()),
    Transaction(
        id: 't2', title: '  clothes', amount: 1567, date: DateTime.now()),
    Transaction(id: 't3', title: 'pizza', amount: 199, date: DateTime.now()),
    Transaction(
        id: 't4', title: ' coldrinks', amount: 99, date: DateTime.now()),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTranscations.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        // return GestureDetector(
        //   onTap: () {},
          child: NewTransaction(_addNewTransaction);
          // behavior: HitTestBehavior.opaque,
        // );
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShivExpenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
       
        fontFamily: 'Quicksand',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Expense app',
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context)),

           // / onPressed: () {
            //   showModalBottomSheet(
            //     context: context,
            //     builder: (_) {
            //       return Container(
            //         height: 200,
            //         color: Colors.amber,
            //         child: Center(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             mainAxisSize: MainAxisSize.min,
            //             children: <Widget>[
            //               c/onst Text('Modal BottomSheet'),
            //               ElevatedButton(
            //                 child: const Text('Close BottomSheet'),
            //                 onPressed: () => Navigator.pop(context),
            //               )
            //             ],
            //           ),
            //         ),
            //       ); // NewTransaction(_addNewTransaction);
            //     },
            //   );
            // },
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('chart'),
                  elevation: 10,
                ),
              ),
              TransactionList(_userTranscations)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ),
    );
  }
}
