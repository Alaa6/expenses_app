import 'dart:developer';

import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseModel extends StatefulWidget {
  const ExpenseModel({
    super.key,
  });

  @override
  State<ExpenseModel> createState() => _ExpenseModelState();
}

class _ExpenseModelState extends State<ExpenseModel> {
  // var _title ='';
  final _titleController = TextEditingController();
  final _amountontroller = TextEditingController();
  final formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.travel;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text('Tilte')),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: _amountontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text('Amount'), prefixText: '\$'),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Row(children: [
              Text(_selectedDate == null
                  ? 'no date selected'
                  : formatter.format(_selectedDate!)),
              IconButton(
                  onPressed: () async {
                    final now = DateTime.now();
                    final firstDate =
                        DateTime(now.year - 1, now.month, now.day);
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: firstDate,
                      lastDate: now,
                    );
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  },
                  icon: const Icon(Icons.calendar_month)),
            ]),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: DropdownButton(
                value: _selectedCategory,
                // menuWidth: double.infinity,
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                onChanged: (newCat) {
                  if (newCat == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = newCat;
                  });
                },
              ),
            ),
            // const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color.fromARGB(255, 200, 52, 52)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final double? enteredAmount =
                    double.tryParse(_amountontroller.text);
                final bool amountIsValid =
                    enteredAmount == null || enteredAmount <= 0;

                if (_titleController.text.trim().isEmpty ||
                    amountIsValid ||
                    _selectedDate == null) {
                  log('error');
                }
              },
              child: const Text('Save Expenses'),
            ),
          ],
        )
      ]),
    );
  }
}
