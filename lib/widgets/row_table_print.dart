import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_test/widgets/column_table_widget.dart';

class RowTablePrintWidget extends StatelessWidget {
  double scale = 0.7;
  double fontsize = 10;

  final String number;
  final String clienID;
  final String clientName;
  final String store;
  final String code;
  final String old;
  final String newProduct;
  final String change;
  final String amount;

  final String backProduct;
  final String orther;
  final String payment;
  final String date;

  RowTablePrintWidget({
    super.key,
    this.number = "ល.រ",
    this.clienID = "លេខកូដអតិថិជន",
    this.clientName = "ឈ្មោះអតិថិជន",
    this.store = "តូប",
    this.code = "កូដ",
    this.old = "ចាស់",
    this.newProduct = "ថ្មី",
    this.change = "ដូរ",
    this.amount = "ទឹកលុយ",
    this.backProduct = "ឥវ៉ាន់ត្រឡប់",
    this.orther = "ផ្សេងៗ",
    this.payment = "ចំនួនទូទាត់",
    this.date = "ថ្ងៃណាត់",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.h, right: 5.h),
      width: double.infinity,
      height: 30.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColumnTableWidget(
            width: 50 * scale,
            title: number ?? "Not specified",
          ),
          ColumnTableWidget(
            width: 130 * scale,
            title: clienID ?? "Not specified",
          ),
          ColumnTableWidget(
              width: 110 * scale, title: clientName ?? "Not specified"),
          ColumnTableWidget(
            width: 100 * scale,
            title: store ?? "Not specified",
          ),
          ColumnTableWidget(
            width: 100 * scale,
            title: code ?? "Not specified",
          ),
          ColumnTableWidget(
            width: 50 * scale,
            title: old ?? "Not specified",
          ),
          ColumnTableWidget(
            width: 50 * scale,
            title: newProduct ?? "Not specified",
          ),
          ColumnTableWidget(
            width: 50 * scale,
            title: change ?? "Not specified",
          ),
          ColumnTableWidget(
            width: 90 * scale,
            title: amount ?? "Not specified",
          ),
          ColumnTableWidget(
            width: 100 * scale,
            title: backProduct ?? "Not specified",
          ),
          ColumnTableWidget(
            width: 100 * scale,
            title: orther ?? "Not specified",
          ),
          ColumnTableWidget(
            width: 90 * scale,
            title: payment ?? "Not specified",
          ),
          ColumnTableWidget(
            width: 80 * scale,
            title: date ?? "Not specified",
          ),
        ],
      ),
    );
  }
}
