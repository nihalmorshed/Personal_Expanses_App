# Personal Expenses App

A comprehensive Flutter application for tracking personal expenses with visual spending analytics through an interactive weekly chart.

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Project Structure](#project-structure)
3. [Architecture & Data Flow](#architecture--data-flow)
4. [Dependencies](#dependencies)
5. [Assets & Resources](#assets--resources)
6. [Theming & Styling](#theming--styling)
7. [Component Documentation](#component-documentation)
   - [Main Application (main.dart)](#1-main-application-maindart)
   - [Transaction Model (transactions.dart)](#2-transaction-model-transactionsdart)
   - [Transaction List (transaction_list.dart)](#3-transaction-list-transaction_listdart)
   - [New Transaction Form (new_transaction.dart)](#4-new-transaction-form-new_transactiondart)
   - [Chart Component (chart.dart)](#5-chart-component-chartdart)
   - [Chart Bar (chart_bar.dart)](#6-chart-bar-chart_bardart)
8. [UI Elements Reference](#ui-elements-reference)
9. [State Management](#state-management)
10. [Quick Reference: Where to Change What](#quick-reference-where-to-change-what)
11. [Known Issues & Notes](#known-issues--notes)

---

## Project Overview

### What This App Does

This is a personal expense tracking application that allows users to:

- **Add new transactions** with a title, amount, and date
- **View all transactions** in a scrollable list format
- **Visualize weekly spending** through a bar chart showing the last 7 days
- **Delete transactions** individually
- **See spending distribution** - each bar shows the percentage of total weekly spending

### Key Features Implemented

| Feature | Description | Location |
|---------|-------------|----------|
| Transaction CRUD | Add and delete expenses | `main.dart`, `new_transaction.dart` |
| Weekly Chart | Visual spending representation for 7 days | `chart.dart`, `chart_bar.dart` |
| Date Picker | Native Flutter date selection | `new_transaction.dart` |
| Empty State | "Zzz" image when no transactions | `transaction_list.dart` |
| Modal Bottom Sheet | Transaction input form as overlay | `main.dart` |
| Custom Fonts | Quicksand and OpenSans typography | `pubspec.yaml` |

---

## Project Structure

```
Personal_Expanses_App/
├── lib/
│   ├── main.dart                 # App entry point, theme, home page, state management
│   ├── transactions.dart         # Transaction data model class
│   ├── transaction_list.dart     # Widget displaying list of transactions
│   ├── new_transaction.dart      # Form widget for adding new transactions
│   ├── chart.dart                # Weekly spending chart container
│   └── chart_bar.dart            # Individual bar in the chart
│
├── assets/
│   ├── fonts/
│   │   ├── OpenSans-Regular.ttf  # Primary body font - Regular weight
│   │   ├── OpenSans-Bold.ttf     # Primary body font - Bold (700)
│   │   ├── Quicksand-Regular.ttf # App-wide default font
│   │   ├── Quicksand-Bold.ttf    # Bold variant (700)
│   │   ├── Quicksand-Light.ttf   # Light variant (not used in pubspec)
│   │   └── Quicksand-Medium.ttf  # Medium variant (not used in pubspec)
│   │
│   └── images/
│       └── waiting.png           # "Zzz" sleeping graphic for empty state
│
├── test/
│   └── widget_test.dart          # Default Flutter test file (needs updating)
│
├── android/                      # Android platform configuration
├── ios/                          # iOS platform configuration
├── web/                          # Web platform configuration
│
├── pubspec.yaml                  # Flutter dependencies and asset declarations
├── analysis_options.yaml         # Dart linter configuration
└── README.md                     # This documentation file
```

---

## Architecture & Data Flow

### Widget Tree Hierarchy

```
MyApp (StatelessWidget)
└── MaterialApp
    └── MyHomePage (StatefulWidget)
        └── Scaffold
            ├── AppBar
            │   ├── Title: "Personal Expenses"
            │   └── IconButton (+ icon)
            │
            ├── Body: SingleChildScrollView
            │   └── Column
            │       ├── Chart (StatelessWidget)
            │       │   └── Card
            │       │       └── Row of ChartBar widgets (7 bars)
            │       │
            │       └── TransactionList (StatelessWidget)
            │           └── Container
            │               ├── [Empty State] Column with Text + Image
            │               └── [Has Data] ListView.builder
            │                   └── Card → ListTile (per transaction)
            │
            └── FloatingActionButton (+ icon)
```

### Data Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                         _MyHomePageState                            │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  List<Transaction> _userTransactions = []                    │   │
│  │                                                              │   │
│  │  Getter: _recentTransactions (filters last 7 days)           │   │
│  │                                                              │   │
│  │  Methods:                                                    │   │
│  │  • _addNewTransaction(title, amount, date) → setState()      │   │
│  │  • _deleteTransaction(id) → setState()                       │   │
│  │  • _startAddNewTransaction(ctx) → showModalBottomSheet()     │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                              │                                       │
│              ┌───────────────┼───────────────┐                       │
│              ▼               ▼               ▼                       │
│        ┌─────────┐    ┌─────────────┐   ┌──────────────┐            │
│        │  Chart  │    │Transaction │   │NewTransaction│            │
│        │         │    │   List     │   │   (Modal)    │            │
│        └────┬────┘    └─────┬──────┘   └──────┬───────┘            │
│             │               │                  │                     │
│  Receives:  │    Receives:  │       Receives:  │                    │
│  _recent    │    _userTrans │       _addNew    │                    │
│  Transact.  │    + deleteTx │       Transaction│                    │
│             │               │       callback   │                    │
└─────────────┴───────────────┴──────────────────┴────────────────────┘
```

### State Management Pattern

This app uses **Lifting State Up** pattern:
- All transaction data lives in `_MyHomePageState`
- Child widgets receive data via constructor parameters
- Child widgets communicate changes via callback functions
- `setState()` triggers UI rebuilds when data changes

---

## Dependencies

### pubspec.yaml Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter` | SDK | Core Flutter framework |
| `cupertino_icons` | ^1.0.2 | iOS-style icons (CupertinoIcons class) |
| `intl` | ^0.17.0 | Date formatting (DateFormat class) |

### Dev Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_test` | SDK | Widget testing framework |
| `flutter_lints` | ^1.0.0 | Recommended lint rules |

### Environment

```yaml
sdk: ">=2.11.0 <3.0.0"
```

---

## Assets & Resources

### Fonts Configuration

#### Quicksand Family (App Default)
- **Usage**: Set as `fontFamily` in app theme - applies to all text by default
- **Files**:
  - `Quicksand-Regular.ttf` - Default weight
  - `Quicksand-Bold.ttf` - Weight 700

#### OpenSans Family (Headlines)
- **Usage**: Applied to `headline1` text style for titles
- **Files**:
  - `OpenSans-Regular.ttf` - Default weight
  - `OpenSans-Bold.ttf` - Weight 700

### Images

#### waiting.png
- **Location**: `assets/images/waiting.png`
- **Content**: Three "Z" characters arranged in a sleeping/waiting pattern
- **Used in**: `transaction_list.dart` line 27-30
- **When shown**: Empty transaction list state
- **Dimensions in app**: 200px height, BoxFit.cover

---

## Theming & Styling

### Color Scheme

| Element | Color | Usage Location |
|---------|-------|----------------|
| Primary | `Colors.purple` | AppBar, buttons, chart bars, date picker |
| Accent | `Colors.amber` | Secondary highlighting, CircleAvatar background |
| Error | Default (red) | Delete button icon |
| Chart Background | `RGB(220, 220, 220)` | Empty portion of chart bars |
| Chart Border | `Colors.grey` | Chart bar border |

### Theme Configuration (main.dart:16-37)

```dart
ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.amber,
  fontFamily: 'Quicksand',
  textTheme: ThemeData.light().textTheme.copyWith(
    headline1: TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    button: TextStyle(color: Colors.white),
  ),
  appBarTheme: AppBarTheme(
    textTheme: ThemeData.light().textTheme.copyWith(
      headline1: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)
```

### Text Styles Reference

| Style Name | Font Family | Size | Weight | Color | Used For |
|------------|-------------|------|--------|-------|----------|
| Default | Quicksand | - | Regular | - | All body text |
| headline1 | OpenSans | 18px | Bold | - | Transaction titles, empty state |
| button | - | - | - | White | Button text |
| AppBar headline1 | OpenSans | 20px | Bold | - | App bar title |

---

## Component Documentation

### 1. Main Application (main.dart)

**File**: `lib/main.dart`
**Lines**: 141
**Purpose**: Application entry point, theme definition, and main state management

#### Classes

##### MyApp (StatelessWidget) - Lines 11-41
The root widget that configures MaterialApp.

**Responsibilities**:
- Define app title: "Personal Expenses"
- Configure global theme (colors, fonts, text styles)
- Set MyHomePage as home screen

**Key Properties**:
```dart
MaterialApp(
  title: 'Personal Expenses',
  theme: ThemeData(...),  // See Theming section
  home: MyHomePage(),
)
```

##### MyHomePage (StatefulWidget) - Lines 43-48
Container widget that delegates to its State.

##### _MyHomePageState (State) - Lines 50-140
The main state management class.

**State Variables**:
| Variable | Type | Default | Purpose |
|----------|------|---------|---------|
| `_userTransactions` | `List<Transaction>` | `[]` (empty) | Stores all transactions |

**Getters**:

| Getter | Return Type | Lines | Purpose |
|--------|-------------|-------|---------|
| `_recentTransactions` | `List<Transaction>` | 66-74 | Filters transactions from last 7 days |

**Filter Logic** (line 67-73):
```dart
_userTransactions.where((tx) {
  return tx.date.isAfter(
    DateTime.now().subtract(Duration(days: 7)),
  );
}).toList();
```

**Methods**:

| Method | Parameters | Lines | Purpose |
|--------|------------|-------|---------|
| `_addNewTransaction` | `String txTitle, double txAmount, DateTime chosenDate` | 76-88 | Creates and adds new Transaction |
| `_startAddNewTransaction` | `BuildContext ctx` | 90-101 | Opens modal bottom sheet |
| `_deleteTransaction` | `String id` | 103-107 | Removes transaction by ID |

**_addNewTransaction Implementation** (lines 76-88):
```dart
void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
  final newTx = Transaction(
    title: txTitle,
    amount: txAmount,
    date: chosenDate,
    id: DateTime.now().toString(),  // Uses timestamp as unique ID
  );
  setState(() {
    _userTransactions.add(newTx);
  });
}
```

**_startAddNewTransaction Implementation** (lines 90-101):
```dart
void _startAddNewTransaction(BuildContext ctx) {
  showModalBottomSheet(
    context: ctx,
    builder: (_) {
      return GestureDetector(
        onTap: () {},  // Prevents closing when tapping inside
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    },
  );
}
```

**Build Method UI Structure** (lines 109-140):

```
Scaffold
├── AppBar
│   ├── title: Text('Personal Expenses')
│   └── actions: [IconButton(icon: Icons.add)]
│
├── body: SingleChildScrollView
│   └── Column (crossAxisAlignment: stretch)
│       ├── Chart(_recentTransactions)
│       └── TransactionList(_userTransactions, _deleteTransaction)
│
├── floatingActionButtonLocation: centerFloat
└── floatingActionButton: FloatingActionButton(icon: Icons.add)
```

---

### 2. Transaction Model (transactions.dart)

**File**: `lib/transactions.dart`
**Lines**: 16
**Purpose**: Data model class representing a single expense transaction

#### Class: Transaction

**Properties**:

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | `String` | Yes | Unique identifier (timestamp-based) |
| `title` | `String` | Yes | Name/description of expense |
| `amount` | `double` | Yes | Cost in dollars |
| `date` | `DateTime` | Yes | Date of transaction |

**Constructor**:
```dart
Transaction({
  @required this.id,
  @required this.title,
  @required this.amount,
  @required this.date,
});
```

**Usage Example**:
```dart
Transaction(
  id: DateTime.now().toString(),
  title: 'New Shoes',
  amount: 69.99,
  date: DateTime.now(),
)
```

---

### 3. Transaction List (transaction_list.dart)

**File**: `lib/transaction_list.dart`
**Lines**: 71
**Purpose**: Displays all transactions or empty state

#### Class: TransactionList (StatelessWidget)

**Constructor Parameters**:

| Parameter | Type | Purpose |
|-----------|------|---------|
| `transactions` | `List<Transaction>` | All transactions to display |
| `deleteTx` | `Function` | Callback to delete a transaction |

**UI Structure**:

```
Container (height: 450px)
├── [IF EMPTY] Column
│   ├── Text('No transactions added yet!')
│   │   └── style: Theme.headline1
│   ├── SizedBox(height: 20)
│   └── Container(height: 200)
│       └── Image.asset('assets/images/waiting.png')
│           └── fit: BoxFit.cover
│
└── [IF HAS DATA] ListView.builder
    └── [FOR EACH] Card
        ├── elevation: 5
        ├── margin: vertical 8, horizontal 5
        └── ListTile
            ├── leading: CircleAvatar
            │   ├── radius: 30
            │   └── Padding(6) → FittedBox → Text('$amount')
            ├── title: Text(transaction.title)
            │   └── style: Theme.headline1
            ├── subtitle: Text(DateFormat.yMMMd().format(date))
            └── trailing: IconButton
                ├── icon: Icons.delete
                ├── color: Theme.errorColor (red)
                └── onPressed: deleteTx(transaction.id)
```

**Key Measurements**:

| Element | Size | Notes |
|---------|------|-------|
| Container | height: 450px | Fixed height for list area |
| Empty image | height: 200px | Waiting.png display size |
| Card margin | V: 8px, H: 5px | Spacing between cards |
| CircleAvatar | radius: 30px | Amount display circle |
| Avatar padding | 6px all | Inner spacing for amount text |

**Date Formatting**:
- Format: `DateFormat.yMMMd()` → "Dec 15, 2024"
- Location: Line 56

**Empty State Visual**:
- Shows "No transactions added yet!" text
- Displays "Zzz" sleeping image (waiting.png)
- Indicates user should add transactions

---

### 4. New Transaction Form (new_transaction.dart)

**File**: `lib/new_transaction.dart`
**Lines**: 115
**Purpose**: Modal form for creating new transactions

#### Class: NewTransaction (StatefulWidget)

**Constructor Parameters**:

| Parameter | Type | Purpose |
|-----------|------|---------|
| `addTx` | `Function` | Callback to add transaction to main list |

#### Class: _NewTransactionState (State)

**State Variables**:

| Variable | Type | Default | Purpose |
|----------|------|---------|---------|
| `_titleController` | `TextEditingController` | new | Controls title input field |
| `_amountController` | `TextEditingController` | new | Controls amount input field |
| `_selectedDate` | `DateTime` | null | Stores picked date |

**Methods**:

##### _submitData() - Lines 18-36
Validates and submits the form data.

**Validation Rules**:
1. Amount cannot be empty (line 19-21)
2. Title cannot be empty (line 25)
3. Amount must be > 0 (line 25)
4. Date must be selected (line 25)

**Implementation**:
```dart
void _submitData() {
  if (_amountController.text.isEmpty) return;

  final enteredTitle = _titleController.text;
  final enteredAmount = double.parse(_amountController.text);

  if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
    return;
  }

  widget.addTx(enteredTitle, enteredAmount, _selectedDate);
  Navigator.of(context).pop();  // Close modal
}
```

##### _presentDatePicker() - Lines 38-53
Shows native date picker dialog.

**Date Picker Configuration**:
| Property | Value | Purpose |
|----------|-------|---------|
| `initialDate` | `DateTime.now()` | Today's date shown first |
| `firstDate` | `DateTime(2019)` | Earliest selectable date |
| `lastDate` | `DateTime.now()` | Cannot select future dates |

**Implementation**:
```dart
void _presentDatePicker() {
  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2019),
    lastDate: DateTime.now(),
  ).then((pickedDate) {
    if (pickedDate == null) return;
    setState(() {
      _selectedDate = pickedDate;
    });
  });
}
```

**UI Structure** (Lines 55-113):

```
Card
├── elevation: 5
└── Container
    └── padding: EdgeInsets.all(10)
        └── Column (crossAxisAlignment: end)
            │
            ├── TextField (Title)
            │   ├── decoration: InputDecoration(labelText: 'Title')
            │   ├── controller: _titleController
            │   └── onSubmitted: _submitData
            │
            ├── TextField (Amount)
            │   ├── decoration: InputDecoration(labelText: 'Amount')
            │   ├── controller: _amountController
            │   ├── keyboardType: TextInputType.number
            │   └── onSubmitted: _submitData
            │
            ├── Container (height: 70)
            │   └── Row
            │       ├── Expanded → Text
            │       │   └── 'No Date Chosen!' OR 'Picked Date: MM/DD/YYYY'
            │       └── FlatButton
            │           ├── textColor: Theme.primaryColor (purple)
            │           ├── text: 'Choose Date' (bold)
            │           └── onPressed: _presentDatePicker
            │
            └── RaisedButton
                ├── text: 'Add Transaction'
                ├── color: Theme.primaryColor (purple)
                ├── textColor: Theme.button.color (white)
                └── onPressed: _submitData
```

**Date Display Format**:
- Before selection: "No Date Chosen!"
- After selection: "Picked Date: 12/15/2024" (DateFormat.yMd())

---

### 5. Chart Component (chart.dart)

**File**: `lib/chart.dart`
**Lines**: 68
**Purpose**: Container widget that calculates and displays weekly spending chart

#### Class: Chart (StatelessWidget)

**Constructor Parameters**:

| Parameter | Type | Purpose |
|-----------|------|---------|
| `recentTransactions` | `List<Transaction>` | Transactions from last 7 days |

**Getters**:

##### groupedTransactionValues - Lines 14-34
Generates spending data for each of the last 7 days.

**Return Type**: `List<Map<String, Object>>`

**Each Map Contains**:
| Key | Type | Value Example |
|-----|------|---------------|
| `'day'` | `String` | "M", "T", "W", etc. (first letter) |
| `'amount'` | `double` | 45.99 |

**Algorithm**:
```dart
List.generate(7, (index) {
  // Get the date for this position (0 = today, 6 = 6 days ago)
  final weekDay = DateTime.now().subtract(Duration(days: index));

  var totalSum = 0.0;

  // Sum all transactions for this specific day
  for (var i = 0; i < recentTransactions.length; i++) {
    if (recentTransactions[i].date.day == weekDay.day &&
        recentTransactions[i].date.month == weekDay.month &&
        recentTransactions[i].date.year == weekDay.year) {
      totalSum += recentTransactions[i].amount;
    }
  }

  return {
    'day': DateFormat.E().format(weekDay).substring(0, 1),  // "Monday" → "M"
    'amount': totalSum,
  };
});
```

**Day Label Format**:
- Uses `DateFormat.E()` which returns full day name ("Monday")
- Takes `.substring(0, 1)` to get first letter only ("M")
- Order: Index 0 = Today, Index 6 = 6 days ago (reversed in display)

##### totalSpending - Lines 36-40
Calculates sum of all spending in the week.

**Return Type**: `double`

**Implementation**:
```dart
double get totalSpending {
  return groupedTransactionValues.fold(0.0, (sum, item) {
    return sum + (item['amount'] as num);
  });
}
```

**UI Structure** (Lines 42-66):

```
Card
├── elevation: 6
├── margin: EdgeInsets.all(20)
└── Padding(all: 10)
    └── Row (mainAxisAlignment: spaceAround)
        └── [FOR EACH DAY] Flexible
            ├── fit: FlexFit.tight
            └── ChartBar(
                  day,           // "M", "T", etc.
                  amount,        // Daily spending
                  percentage,    // amount / totalSpending (or 0 if no spending)
                )
```

**Percentage Calculation** (Line 57-59):
```dart
totalSpending == 0.0
    ? 0.0
    : (data['amount'] as double) / totalSpending
```

---

### 6. Chart Bar (chart_bar.dart)

**File**: `lib/chart_bar.dart`
**Lines**: 55
**Purpose**: Individual vertical bar showing daily spending with fill level

#### Class: ChartBar (StatelessWidget)

**Constructor Parameters**:

| Parameter | Type | Example | Purpose |
|-----------|------|---------|---------|
| `label` | `String` | "M" | Day of week abbreviation |
| `spendingAmount` | `double` | 45.99 | Dollar amount for this day |
| `spendingPctOfTotal` | `double` | 0.35 | Percentage (0.0 to 1.0) |

**Visual Representation**:

```
     ┌─────┐
     │ $46 │ ← Amount (FittedBox scales to fit)
     └─────┘
        │
        ▼
     ┌─────┐
     │░░░░░│ ← Empty portion (light grey background)
     │░░░░░│
     │█████│ ← Filled portion (purple, based on percentage)
     │█████│
     │█████│
     └─────┘
        │
        ▼
     ┌─────┐
     │  M  │ ← Day label
     └─────┘
```

**UI Structure**:

```
Column
├── Container (height: 20)
│   └── FittedBox
│       └── Text('$${spendingAmount.toStringAsFixed(0)}')
│           Example: "$46"
│
├── SizedBox(height: 4)
│
├── Container (height: 60, width: 10)
│   └── Stack
│       ├── [BOTTOM LAYER] Container
│       │   └── BoxDecoration
│       │       ├── border: grey, 1px
│       │       ├── color: RGB(220, 220, 220)
│       │       └── borderRadius: circular(10)
│       │
│       └── [TOP LAYER] FractionallySizedBox
│           ├── heightFactor: spendingPctOfTotal (0.0 to 1.0)
│           └── Container
│               └── BoxDecoration
│                   ├── color: Theme.primaryColor (purple)
│                   └── borderRadius: circular(10)
│
├── SizedBox(height: 4)
│
└── Text(label)  // "M", "T", "W", etc.
```

**Key Measurements**:

| Element | Dimension | Notes |
|---------|-----------|-------|
| Amount container | height: 20px | FittedBox auto-scales text |
| Spacer | height: 4px | Between amount and bar |
| Bar container | 60px × 10px | Fixed size vertical bar |
| Border radius | 10px | Rounded corners on bar |
| Border width | 1px | Grey outline |
| Spacer | height: 4px | Between bar and label |

**Fill Animation**:
- The `FractionallySizedBox` with `heightFactor` creates the fill effect
- `heightFactor: 0.5` fills 50% from bottom
- `heightFactor: 1.0` fills entire bar
- **Note**: Currently no animation - fill changes instantly on rebuild

**Amount Display**:
- Uses `toStringAsFixed(0)` to remove decimal places
- $45.99 displays as "$46"

---

## UI Elements Reference

### Buttons

| Button | Type | Location | Color | Action |
|--------|------|----------|-------|--------|
| AppBar + | IconButton | main.dart:117-120 | White (on purple) | Opens add modal |
| FAB + | FloatingActionButton | main.dart:134-137 | Purple | Opens add modal |
| Choose Date | FlatButton | new_transaction.dart:90-99 | Purple text | Opens date picker |
| Add Transaction | RaisedButton | new_transaction.dart:103-108 | Purple bg, white text | Submits form |
| Delete | IconButton | transaction_list.dart:58-61 | Red | Deletes transaction |

### Cards

| Card | Elevation | Margin | Location |
|------|-----------|--------|----------|
| Chart | 6 | 20px all sides | chart.dart:44-45 |
| New Transaction Form | 5 | none | new_transaction.dart:57 |
| Transaction Item | 5 | V: 8px, H: 5px | transaction_list.dart:35-39 |

### Input Fields

| Field | Type | Keyboard | Controller | Location |
|-------|------|----------|------------|----------|
| Title | TextField | Default | _titleController | new_transaction.dart:64-71 |
| Amount | TextField | Number | _amountController | new_transaction.dart:72-78 |

---

## State Management

### State Location

All mutable state lives in `_MyHomePageState`:

```dart
class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];
  // ...
}
```

### State Mutations

| Action | Method | setState Call | Triggers Rebuild Of |
|--------|--------|---------------|---------------------|
| Add transaction | `_addNewTransaction()` | Yes (line 85-87) | Chart, TransactionList |
| Delete transaction | `_deleteTransaction()` | Yes (line 104-106) | Chart, TransactionList |

### Data Derivation

| Derived Data | Source | Computation |
|--------------|--------|-------------|
| `_recentTransactions` | `_userTransactions` | Filter last 7 days |
| `groupedTransactionValues` | `recentTransactions` | Group by day, sum amounts |
| `totalSpending` | `groupedTransactionValues` | Sum all amounts |
| `spendingPctOfTotal` | `amount / totalSpending` | Per-bar percentage |

---

## Quick Reference: Where to Change What

### Colors

| To Change | File | Line | Current Value |
|-----------|------|------|---------------|
| Primary app color | main.dart | 17 | `Colors.purple` |
| Accent color | main.dart | 18 | `Colors.amber` |
| Chart bar fill | chart_bar.dart | 39 | `Theme.primaryColor` |
| Chart bar background | chart_bar.dart | 31 | `RGB(220, 220, 220)` |
| Chart bar border | chart_bar.dart | 30 | `Colors.grey` |
| Delete button | transaction_list.dart | 60 | `Theme.errorColor` |

### Fonts

| To Change | File | Line | Current Value |
|-----------|------|------|---------------|
| App default font | main.dart | 20 | `'Quicksand'` |
| Headline font | main.dart | 22 | `'OpenSans'` |
| Headline size | main.dart | 25 | `18` |
| AppBar title size | main.dart | 33 | `20` |

### Sizes & Dimensions

| To Change | File | Line | Current Value |
|-----------|------|------|---------------|
| Transaction list height | transaction_list.dart | 14 | `450` |
| Empty state image height | transaction_list.dart | 25 | `200` |
| Chart card margin | chart.dart | 45 | `20` |
| Chart bar height | chart_bar.dart | 23 | `60` |
| Chart bar width | chart_bar.dart | 24 | `10` |
| CircleAvatar radius | transaction_list.dart | 43 | `30` |
| Card elevation (chart) | chart.dart | 44 | `6` |
| Card elevation (items) | transaction_list.dart | 36 | `5` |

### Behavior

| To Change | File | Line | Current Value |
|-----------|------|------|---------------|
| Days shown in chart | chart.dart | 15 | `7` |
| Recent transactions filter | main.dart | 70 | `7` days |
| Date picker start year | new_transaction.dart | 42 | `2019` |
| Amount decimal places | chart_bar.dart | 17 | `0` (toStringAsFixed) |

### Text Content

| To Change | File | Line | Current Value |
|-----------|------|------|---------------|
| App title | main.dart | 15, 113-115 | `'Personal Expenses'` |
| Empty state message | transaction_list.dart | 19 | `'No transactions added yet!'` |
| Date not chosen text | new_transaction.dart | 86 | `'No Date Chosen!'` |
| Date chosen prefix | new_transaction.dart | 87 | `'Picked Date: '` |
| Add button text | new_transaction.dart | 104 | `'Add Transaction'` |
| Choose date button | new_transaction.dart | 93 | `'Choose Date'` |
| Title input label | new_transaction.dart | 65 | `'Title'` |
| Amount input label | new_transaction.dart | 73 | `'Amount'` |

### Date Formats

| To Change | File | Line | Current Format |
|-----------|------|------|----------------|
| Transaction date | transaction_list.dart | 56 | `DateFormat.yMMMd()` → "Dec 15, 2024" |
| Picked date display | new_transaction.dart | 87 | `DateFormat.yMd()` → "12/15/2024" |
| Chart day labels | chart.dart | 30 | `DateFormat.E().substring(0,1)` → "M" |

---

## Known Issues & Notes

### Deprecated APIs Used

The app uses some deprecated Flutter APIs (suppresssed with ignore comments):

| Deprecated | Current Alternative | Location |
|------------|---------------------|----------|
| `accentColor` | `colorScheme.secondary` | main.dart:18 |
| `FlatButton` | `TextButton` | new_transaction.dart:90 |
| `RaisedButton` | `ElevatedButton` | new_transaction.dart:103 |
| `headline1` | `headlineLarge` or custom | multiple files |
| `@required` | `required` (no @) | transactions.dart:10-13 |

### Unused Import

- `dart:ffi` is imported but not used in `chart.dart:1`

### Test File

The widget test file (`test/widget_test.dart`) contains the default counter test template and needs to be updated to test actual app functionality.

### ID Generation

Transaction IDs are generated using `DateTime.now().toString()`:
- Format: "2024-12-15 10:30:45.123456"
- **Potential issue**: Rapid additions could create duplicate IDs (millisecond precision)

### No Data Persistence

- All transactions are stored in memory only
- Data is lost when app restarts
- To add persistence, consider:
  - `shared_preferences` for simple storage
  - `sqflite` for SQLite database
  - `hive` for NoSQL storage

### Fixed Container Heights

- Transaction list has fixed 450px height
- May cause issues on different screen sizes
- Consider using `Expanded` or `MediaQuery` for responsive design

---

## Development Commands

```bash
# Run the app
flutter run

# Build for release
flutter build apk        # Android
flutter build ios        # iOS
flutter build web        # Web

# Run tests
flutter test

# Analyze code
flutter analyze

# Get dependencies
flutter pub get
```

---

## File Modification Quick Guide

### Adding a New Field to Transaction

1. Add property to `Transaction` class in `transactions.dart`
2. Update constructor with `@required` parameter
3. Update `_addNewTransaction()` in `main.dart`
4. Update `NewTransaction` form if user input needed
5. Update `TransactionList` to display new field

### Changing Chart to Show More/Fewer Days

1. Change `7` to desired number in `chart.dart:15`
2. Change `7` in `main.dart:70` to match (recentTransactions filter)

### Adding New Theme Color

1. Add color to `ThemeData` in `main.dart`
2. Access via `Theme.of(context).yourColor` in widgets

### Modifying Transaction Card Layout

1. Edit `TransactionList` widget (`transaction_list.dart:34-64`)
2. The `ListTile` structure can be replaced with custom `Row`/`Column`

---

*Documentation generated: December 2024*
*App Version: 1.0.0+1*
