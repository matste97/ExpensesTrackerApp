import 'package:flutter/material.dart';

import 'package:expensestrackerapp/widgets/expenses_list/expense_item.dart';
import 'package:expensestrackerapp/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
    required this.onChangeExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  final void Function(Expense expense, int index) onChangeExpense;

  @override
  Widget build(BuildContext context) {
    // Build the UI for displaying the list of expenses
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        // Background color for swiping to delete
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          // Invoke the callback to remove the expense
          onRemoveExpense(expenses[index]);
        },
        child: GestureDetector(
          onTap: () {
            // Invoke the callback to edit the expense
            onChangeExpense(expenses[index], index);
          },
          child: ExpenseItem(expenses[index]), // Display the expense item
        ),
      ),
    );
  }
}
