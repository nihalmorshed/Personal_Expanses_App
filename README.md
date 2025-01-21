# Personal Expenses Tracker 💰

A Flutter application that helps users track their daily expenses with an intuitive interface and visual charts. This application provides a weekly overview of spending patterns and detailed transaction management.

## Features

- Track daily expenses with title, amount, and date
- Visual weekly spending chart with dynamic bars
- Detailed transaction list with delete functionality
- Date picker for transaction entries
- Responsive UI with custom themes and fonts
- Input validation for transaction entries
- Empty state handling with placeholder image
- Custom fonts (OpenSans and Quicksand) for enhanced typography

## Project Architecture

```
lib/
├── main.dart             # Application entry point and theme configuration
├── transactions.dart     # Transaction model definition
├── chart.dart            # Weekly spending chart widget
├── chart_bar.dart        # Individual bar component for the chart
├── new_transaction.dart  # Form widget for adding transactions
└── transaction_list.dart # List widget displaying all transactions
```

## Prerequisites

- Flutter SDK (>=2.11.0 <3.0.0)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

## Installation

1. Clone the repository
```bash
git clone [your-repository-link]
```

2. Navigate to project directory
```bash
cd personal_expenses
```

3. Install dependencies
```bash
flutter pub get
```

4. Run the application
```bash
flutter run
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.17.0          # For date formatting
  cupertino_icons: ^1.0.2
```

## Assets

The project uses the following assets:
- Images: `assets/images/waiting.png` for empty state
- Fonts:
  - OpenSans (Regular, Bold)
  - Quicksand (Regular, Bold)

## Theme Customization

The application uses a custom theme with:
- Primary color: Purple
- Accent color: Amber
- Custom font families: OpenSans and Quicksand
- Custom text styles for headlines and buttons

## Usage

1. Launch the application
2. Add new transactions using the '+' button (either in AppBar or floating button)
3. Fill in the transaction details:
   - Title of the expense
   - Amount spent
   - Date of transaction
4. View your spending patterns in the chart at the top
5. Delete transactions by tapping the trash icon
6. Monitor your weekly spending through the visual chart bars

## Key Components

### Chart
- Displays last 7 days of spending
- Dynamic bars showing spending percentage
- Daily total amount displayed above each bar

### Transaction List
- Scrollable list of all transactions
- Each transaction shows:
  - Amount in a circular avatar
  - Title and date
  - Delete option

### New Transaction Form
- Input validation for title and amount
- Date picker with custom formatting
- Automatic keyboard type for amount input
- Submit button with theme-consistent styling

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter development team
- Material Design guidelines
- Intl package contributors
