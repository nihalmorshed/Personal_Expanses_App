# Personal Expenses App

A Flutter application for tracking personal expenses with visual spending analytics.

## Features

- **Add Transactions** - Record expenses with title, amount, and date
- **Weekly Chart** - Visual bar chart showing spending over the last 7 days
- **Transaction List** - View and manage all your expenses
- **Delete Transactions** - Remove expenses with a single tap
- **Date Picker** - Select transaction dates using native date picker
- **Responsive Design** - Clean Material Design interface

## Screenshots

The app displays a weekly spending chart at the top and a scrollable list of transactions below. An empty state shows a friendly "Zzz" illustration when no transactions exist.

## Getting Started

### Prerequisites

- Flutter SDK (>=2.11.0)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Personal_Expanses_App.git
   ```

2. Navigate to the project directory:
   ```bash
   cd Personal_Expanses_App
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Tech Stack

- **Flutter** - UI framework
- **Dart** - Programming language
- **intl** - Date formatting

## Project Structure

```
lib/
├── main.dart              # App entry point and theme
├── transactions.dart      # Transaction data model
├── transaction_list.dart  # Transaction list display
├── new_transaction.dart   # Add transaction form
├── chart.dart             # Weekly spending chart
└── chart_bar.dart         # Individual chart bars
```

## Usage

1. Tap the **+** button (AppBar or floating button) to add a new transaction
2. Enter the transaction title and amount
3. Select a date using the date picker
4. Tap "Add Transaction" to save
5. View your spending patterns in the weekly chart
6. Swipe or tap the delete icon to remove transactions

## Documentation

For detailed technical documentation including architecture, component specs, and code reference, see [TECHNICAL.md](TECHNICAL.md).

## License

This project is open source and available for personal and educational use.

---

*Built with Flutter*
