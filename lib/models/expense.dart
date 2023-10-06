import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Define a date format for formatting dates.
final formatter = DateFormat.yMd();

// Generate a UUID (Universally Unique Identifier) for unique expense IDs.
const uuid = Uuid();

// Define an enumeration 'Category' to represent expense categories.
enum Category { food, travel, leisure, work }

// Define a mapping of category values to corresponding icons.
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

// Define a class 'Expense' to represent individual expenses.
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // Generate a unique ID for each expense.

  final String id; // Unique identifier for the expense.
  final String title; // Title of the expense.
  final double amount; // Amount spent on the expense.
  final DateTime date; // Date when the expense was incurred.
  final Category category; // Category of the expense.

  String get formattedDate {
    return formatter.format(date); // Format the date as a string.
  }
}

// Define a class 'ExpenseBucket' to group expenses by category.
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  // Constructor for creating a bucket of expenses for a specific category.
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category; // Category associated with the bucket.
  final List<Expense> expenses; // List of expenses in the bucket.

  double get totalExpenses {
    double sum = 0;

    // Calculate the total sum of expenses in the bucket.
    for (final expense in expenses) {
      sum += expense.amount; // Sum the amount of each expense.
    }

    return sum; // Return the total sum of expenses.
  }
}
