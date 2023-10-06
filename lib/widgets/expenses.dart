import 'package:flutter/material.dart';
import 'package:expensestrackerapp/widgets/new_expense.dart';
import 'package:expensestrackerapp/widgets/expenses_list/expenses_list.dart';
import 'package:expensestrackerapp/models/expense.dart';
import 'package:expensestrackerapp/widgets/chart/chart.dart';
import 'package:expensestrackerapp/widgets/change_expense.dart';

// Define a stateful widget 'Expenses' for managing expenses.
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

// Define the state for the 'Expenses' widget.
class _ExpensesState extends State<Expenses> {
  // List to store registered expenses (initially populated with sample data).
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  // Function to open the 'NewExpense' overlay.
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  // Function to add a new expense to the list.
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  // Function to remove an expense from the list and show a snackbar.
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  // Function to open the 'ChangeExpense' overlay for editing an expense.
  void _openChangeExpense(Expense expense, int index) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => ChangeExpense(
        onChangeExpense: (updatedExpense) {
          _changeExpense(updatedExpense, index);
        },
      ),
    );
  }

  // Function to edit an existing expense.
  void _changeExpense(Expense updatedExpense, int index) {
    setState(() {
      _registeredExpenses[index] = updatedExpense;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize 'mainContent' with a message when no expenses are present.
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    // If there are expenses in the list, update 'mainContent' to display the list.
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
        onChangeExpense: _openChangeExpense,
      );
    }

    // Build the main scaffold with an app bar, chart, and expenses list.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          // Display a chart summarizing expenses.
          Chart(expenses: _registeredExpenses),

          // Display either "No expenses found" or the list of expenses.
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
