import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.myExpenses,
  });

  final List<Expense> myExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myExpenses.length,
      itemBuilder: (context, index) => ExpensesItem(expense: myExpenses[index]),
    );
  }
}


