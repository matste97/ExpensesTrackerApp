# Expenses Tracker App

Assignment 1 in IDATA2503 - Mobile applications.

## Project File Structure

- **lib**
  - **models**
    - File: `expense.dart`
  - **widgets**
    - **chart**
      - File: `chart_bar.dart`
      - File: `chart.dart`
    - **expense_list**
      - File: `expense_item.dart`
      - File: `expense_list.dart`
    - File: `expenses.dart`
    - File: `new_expense.dart`
    - File: `change_expense.dart`
  - File: `main.dart`

## Project Overview

The `lib` folder serves as the root directory for all Dart files in the project. Here's a breakdown of the folder structure:

### `models`

The `models` folder contains data models used throughout the app. In this case, it includes a single file, `expense.dart`, which represents an individual expense. This file defines attributes like amount, name, category, date, and a UUID for unique identification.

### `widgets`

The `widgets` folder is where all the custom widgets used to build the app are organized. To maintain a clean and structured codebase, it further subdivides into subfolders:

#### `chart`

- File: `chart_bar.dart`
- File: `chart.dart`

These files are responsible for creating and displaying a chart that visualizes expense categories. `chart_bar.dart` handles individual bars within the chart, while `chart.dart` manages the overall chart display.

#### `expense_list`

- File: `expense_item.dart`
- File: `expense_list.dart`

This subfolder is dedicated to displaying expenses as a list. `expense_item.dart` defines how individual expense items are rendered, and `expense_list.dart` manages the list of expenses.

#### Other Widgets

The remaining widget files, `expenses.dart`, `new_expense.dart`, and `change_expense.dart`, are stored directly under the `widgets` folder.

- `expenses.dart` serves as the main page of the app and contains both the chart and the expense list. It also handles functions related to adding, removing, and editing expenses.
- `new_expense.dart` and `edit_expense.dart` are responsible for creating overlays for adding and editing expenses. These files structure the overlay interfaces and manage user input for creating new expenses and editing existing ones.

## User Story

As a user who wants to manage my expenses effectively, I want to use an expense tracking app to:

- **Add Expenses:** I want to be able to add new expenses, including the expense's title, amount, date, and category.

- **Edit Expenses:** I want to have the ability to edit existing expenses, including modifying the title, amount, date, and category.

- **View Expenses:** I want to see a list of all my expenses and have the option to view details, such as the expense title, amount, date, and category.

- **Visualize Expenses:** I want to view a chart that visually represents my expenses by category, helping me understand my spending habits at a glance.

- **Remove Expenses:** I want to remove expenses that I no longer need to track.

## Added Functionality
The added functionality is the option to make changes to the registered expenses. This is done by simply clicking on an expense, and then updating the expense as if you are adding a new one. I created a new widget called ChangeExpense, based on NewExpense. I then changed the button text in NewExpense to 'Create' and in ChangeExpense to 'Save' to differentiate them for the user.

In ExpensesList, I added a function called onChangeExpense to the constructor and included a GestureDetector with an onTap event that calls the onChangeExpense function. onChangeExpense takes the index of the expense and the expense itself as parameters.

In Expenses, I created two new functions: _openChangeExpense and _changeExpense. _openChangeExpense is similar to _openAddExpenseOverlay but uses the ChangeExpense widget and calls _changeExpense. The _changeExpense function replaces the old expense with the new one created.
