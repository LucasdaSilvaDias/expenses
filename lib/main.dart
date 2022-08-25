// ignore_for_file: prefer_const_constructors

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/components/transaction_user.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '/components/transaction_form.dart';
import '/components/transaction_list.dart';
import '../models/transaction.dart';
import 'dart:math';

main() => runApp(Expensesapp());

class Expensesapp extends StatefulWidget {
  const Expensesapp({Key? key}) : super(key: key);

  @override
  State<Expensesapp> createState() => _ExpensesappState();
}

class _ExpensesappState extends State<Expensesapp> {
  final _userTransactions = [
    Transaction(id: 't1', title: 'tenis', value: 310, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'conta de luz', value: 181, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(id: 't1', title: 'tenis', value: 310, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'conta de luz', value: 181, date: DateTime.now()),
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        backgroundColor: Color.fromARGB(255, 255, 0, 238),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Card(
              color: Color.fromARGB(255, 255, 0, 238),
              child: Text('Gráfico'),
              elevation: 5,
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
