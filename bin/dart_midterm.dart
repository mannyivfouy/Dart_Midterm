import 'dart:io';
import 'package:intl/intl.dart';

void main() {
  double loanMoney = 1000;
  double loanRate = 1.50;
  int loanTerm = 12;
  DateTime loanDate = DateTime.parse('2024-08-13');
  String formatDate = DateFormat('yyyy-MM-dd EEE').format(loanDate);

  double principle = loanMoney / loanTerm;
  double interest = (loanMoney * loanRate) /100;
  double balance = loanMoney - principle;

  String formatLoanMoney = loanMoney.toStringAsFixed(2);
  String formatLoanRate = loanRate.toStringAsFixed(2);

  stdout.writeln("="*140);
  stdout.writeln("Loan Money  : \$$formatLoanMoney".padRight(35) + "Loan Rate : $formatLoanRate");
  stdout.writeln("Borrow Date : $formatDate".padRight(35) + "Loan Term : $loanTerm");
  stdout.writeln("="*140);
  stdout.writeln("N".padRight(10) + "Date of Payment".padRight(30) + "Payment".padRight(30) + "Interest".padRight(30) + "Principle".padRight(30) + "Balance");
}