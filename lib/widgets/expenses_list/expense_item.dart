import 'package:flutter/material.dart';
import 'package:expensestrackerapp/models/expense.dart';

// Define a stateless widget 'ExpenseItem' for displaying an individual expense.
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    // Build a Card widget to display the expense information.
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the expense title using a larger text style.
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4), // Add some vertical spacing.
            Row(
              children: [
                // Display the expense amount with 2 decimal places.
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                ),
                const Spacer(), // Push items to the right end of the row.
                Row(
                  children: [
                    // Display the category icon and the formatted date.
                    Icon(categoryIcons[
                        expense.category]), // Icon for the category.
                    const SizedBox(width: 8), // Add some horizontal spacing.
                    Text(expense
                        .formattedDate), // Formatted date of the expense.
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
