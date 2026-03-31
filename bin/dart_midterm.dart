import 'dart:io';
import 'package:intl/intl.dart';

void main() {
  double loanMoney = 1000;
  double loanRate = 1.50;
  int loanTerm = 12;
  DateTime loanDate = DateTime.parse('2024-08-13');
  String formatDate = DateFormat('yyyy-MM-dd').format(loanDate);
  
  
  print("Loan Money : \$$loanMoney".padRight(30) + "Loan Rate : %$loanRate");
  print("Loan Date  : $formatDate".padRight(30) + "Loan Term : $loanTerm");
}