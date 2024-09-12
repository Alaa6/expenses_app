import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/expense_model.dart';
import 'package:expenses_app/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> myExpenses = [
    Expense(
      title: 'food',
      amount: 50,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'work',
      amount: 150,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'transportation',
      amount: 100,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello'), actions: [
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (ctx) => const ExpenseModel());
            },
            icon: const Icon(Icons.add))
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Expanded(child: ExpensesList(myExpenses: myExpenses))],
        ),
      ),
    );
  }
}

