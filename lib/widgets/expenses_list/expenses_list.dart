// Import the necessary Flutter packages and widgets.
import 'package:flutter/material.dart';
import 'package:expensestrackerapp/widgets/expenses_list/expense_item.dart';
import 'package:expensestrackerapp/models/expense.dart';

// Define a stateless widget 'ExpensesList' for displaying a list of expenses.
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
    // Build the UI for displaying the list of expenses using a ListView.
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        // Define the background color when swiping to delete an item.
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(expenses[index]),

        // Callback when an item is dismissed (swiped away).
        onDismissed: (direction) {
          // Invoke the callback to remove the expense.
          onRemoveExpense(expenses[index]);
        },
        child: GestureDetector(
          onTap: () {
            // Invoke the callback to edit the expense.
            onChangeExpense(expenses[index], index);
          },
          child: ExpenseItem(expenses[index]), // Display the expense item.
        ),
      ),
    );
  }
}
