import 'dart:io';
import 'package:intl/intl.dart';

void main() {

  DateTime borrowDate = DateTime.parse('2024-08-13');
  double loanAmount = 1000;
  int loanTerm = 12;
  double rate = 1.5;

  double principle = loanAmount / loanTerm;
  double balance = loanAmount - principle;
  var formatedDate = DateFormat('yyyy-MM-dd EEEE');

  stdout.writeln('-' * 150);
  stdout.writeln('Loan Money  : ${loanAmount.toStringAsFixed(2)}'.padRight(40)+
      'Loan Rate :${rate.toStringAsFixed(2)}');
  stdout.writeln('Borrow Date : ${formatedDate.format(borrowDate)}'.padRight(40)+
      'Term Loan : $loanTerm');
  stdout.writeln('-' * 150);

  stdout.writeln('N'.padRight(10) +
      'Date of Payment'.padRight(30) +
      'Payment'.padRight(30) +
      'Interest'.padRight(30) +
      'Principle'.padRight(30) +
      'Balance');
  stdout.writeln('-' * 150);

  for (int i = 1; i <= loanTerm; i++) {

    DateTime paymentDate = DateTime(
      borrowDate.year,
      borrowDate.month + i,
      borrowDate.day,
    );

    int dayAdd = 0;
    if (paymentDate.weekday == 6) dayAdd = 2;
    if (paymentDate.weekday == 7) dayAdd = 1;

    paymentDate = DateTime(
      borrowDate.year,
      borrowDate.month + i,
      borrowDate.day + dayAdd,
    );

    double extraInterest = ((loanAmount * rate) / (100 * 30)) * dayAdd;
    double interest      = (loanAmount * rate) / 100 + extraInterest;
    double payment       = principle + interest;

    stdout.writeln(
      '$i'.padRight(10)                                          +
          formatedDate.format(paymentDate).padRight(30)              +
          payment  .toStringAsFixed(2).padRight(30)                  +
          interest .toStringAsFixed(2).padRight(30)                  +
          principle.toStringAsFixed(2).padRight(30)                  +
          (balance < 0 ? '0.00' : balance.toStringAsFixed(2)),
    );
    stdout.writeln('-' * 150);

    if (dayAdd > 0) borrowDate = borrowDate.add(Duration(days: dayAdd));
    loanAmount = balance;
    balance    = loanAmount - principle;
  }
}