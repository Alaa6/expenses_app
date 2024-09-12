import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(categoryIcon[expense.category]),
              const SizedBox(
                width: 5,
              ),
               Text(
                   expense.title ,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ]),
            const SizedBox(
              height: 5,
            ),

           
            Row(
              children: [
                
                const Text('Amount :'),
                const SizedBox(
                  width: 5,
                ),
                // const Spacer() ,
                Text('\$${expense.amount.toStringAsFixed(2)}')
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text('Date :'),
                const SizedBox(
                  width: 5,
                ),
                Text(expense.formttedDate.toString())
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}
