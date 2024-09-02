import 'dart:typed_data';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:interview_test/controllers/controller.dart';
import 'dart:ui' as ui;

import 'package:interview_test/utils/print_pdf.dart';
import 'package:interview_test/widgets/column_header_widget.dart';
import 'package:interview_test/widgets/column_table_widget.dart';
import 'package:interview_test/widgets/empty_page_widget.dart';
import 'package:interview_test/widgets/row_table_print.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class PreviewBeforPrintPage extends StatefulWidget {
  const PreviewBeforPrintPage({super.key});

  @override
  State<PreviewBeforPrintPage> createState() => _PreviewBeforPrintPageState();
}

class _PreviewBeforPrintPageState extends State<PreviewBeforPrintPage> {
  GlobalKey _globalKey = GlobalKey();

  Future<Uint8List> _capturePng() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  bool isSubmit = false;
  @override
  void initState() {
    isSubmit = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = 842;

    double height = 595;
    double scale = 0.7;
    double fontsize = 10;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: EmptyPageWidget(),
            ),
          ),
          Positioned(
            left: 40.h,
            child: isSubmit
                ? Container(
                    width: width,
                    height: height,
                    color: Colors.white,
                    child: RepaintBoundary(
                      key: _globalKey,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          color: Colors.white,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                  child: Container(
                                width: double.infinity,
                                height: double.infinity,
                              )),
                              Positioned(
                                top: 30.h,
                                child: Text(
                                  'របាយការណ៍ប្រមូលលុយប្រចាំថ្ងៃ ${manageInvoiceController.dateInvoice.toLocal().toString().split(' ')[0]} ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Positioned(
                                left: 10.h,
                                top: -20.h,
                                child: Image(
                                  fit: BoxFit.fill,
                                  width: 100.h,
                                  height: 100.h,
                                  image: AssetImage(
                                    "assets/images/Tonaire Digital.png",
                                  ),
                                ),
                              ),
                              // Content
                              Positioned(
                                top: 80.h,
                                child: Container(
                                  width: width - 10.h,
                                  height: height - 40.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RowTablePrintWidget(),
                                      ...allSale(),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 5.h, right: 5.h),
                                        width: double.infinity,
                                        height: 30.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ColumnTableWidget(
                                                width: 390 * scale,
                                                title: "សរុប"),
                                            ColumnTableWidget(
                                                width: 100 * scale,
                                                title:
                                                    "${manageInvoiceController.choseAreas.length}"),
                                            ColumnTableWidget(
                                                width: 50 * scale, title: "0"),
                                            ColumnTableWidget(
                                                width: 50 * scale,
                                                title:
                                                    "${manageInvoiceController.totalNewCans.value}"),
                                            ColumnTableWidget(
                                                width: 50 * scale, title: "0"),
                                            ColumnTableWidget(
                                                width: 90 * scale,
                                                title:
                                                    "\$${manageInvoiceController.totalAmountChoseMakeInvoice.value.toStringAsFixed(2)}"),
                                            ColumnTableWidget(
                                                width: 100 * scale, title: ""),
                                            ColumnTableWidget(
                                                width: 100 * scale, title: ""),
                                            ColumnTableWidget(
                                                width: 90 * scale, title: ""),
                                            ColumnTableWidget(
                                                width: 80 * scale, title: ""),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(30.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // box 1
                                            Container(
                                              width: 190,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                  right: BorderSide(
                                                      color: Colors.black),
                                                  top: BorderSide(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "លុយប្រមូលបាន  : ${manageInvoiceController.getDriver().driverName}",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "ដុល្លា(\$)             ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "រៀល(៛)              ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "សរុបទឹកលុយ      ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "អត្រាប្ដូរប្រាក់       ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //box 2
                                            Container(
                                              width: 190,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                  right: BorderSide(
                                                      color: Colors.black),
                                                  top: BorderSide(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "សរុបវិក័យប័ត្រ  ",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "បុងបានទូទាត់         ...............................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "បុងអត់បានទូទាត់    ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "បុងត្រឡប់             ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "សរុប                    .............................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //box 3
                                            Container(
                                              width: 190,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                  right: BorderSide(
                                                      color: Colors.black),
                                                  top: BorderSide(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "លុយទទួលបាន",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "ដុល្លា(\$)             ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "រៀល(៛)              ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "សរុបប្រាក់          ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "បាត់/លំអៀង       ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //box 4
                                            Container(
                                              width: 190,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                  right: BorderSide(
                                                      color: Colors.black),
                                                  top: BorderSide(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "ចំណាយ",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "1.                 ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "2.                 ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "3.                 ...................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "សរុបចំណាយ  ................................",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        wordSpacing: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ),
          Positioned(
              right: 40.h,
              child: Container(
                width: 400.h,
                height: height,
                color: Colors.white.withOpacity(0.94),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                              "assets/images/${manageInvoiceController.getDriver().image}"),
                          width: 150.h,
                        ),
                      ],
                    ),
                    Text(
                        "ឈ្មោះអ្នកដឹកជញ្ជូន ${manageInvoiceController.getDriver().driverName} "),
                    Text(
                        "ថ្ងៃចេញវិក្ក័យបត្រ  ${manageInvoiceController.dateInvoice.toLocal().toString().split(' ')[0]}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100.h,
                          height: 90.h,
                          child: BounceInUp(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                  disabledForegroundColor: Colors.black,
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder()),
                              onPressed: () {
                                ;
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.restart_alt_outlined,
                                    color: Colors.grey,
                                    size: 50.h,
                                  ),
                                  Text("Reset")
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100.h,
                          height: 90.h,
                          child: BounceInUp(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                  disabledForegroundColor: Colors.black,
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder()),
                              onPressed: () {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: "Submit  ជោគជ័យ",
                                  title: "ជោគជ័យ",
                                  showCancelBtn: false,
                                  showConfirmBtn: true,
                                  confirmBtnText: "យល់ព្រម",
                                  onCancelBtnTap: () {
                                    Get.back();
                                  },
                                );
                                setState(() {
                                  isSubmit = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.send,
                                    size: 50.h,
                                  ),
                                  Text("Submit")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100.h,
                          height: 150.h,
                          child: BounceInUp(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                  disabledForegroundColor: Colors.black,
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder()),
                              onPressed: () async {
                                Uint8List imageBytes = await _capturePng();
                                final pdf = await generateKhmerPdf(imageBytes);
                                savePdf(context, pdf);
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.save,
                                    size: 50.h,
                                  ),
                                  Text("រក្សាទុក")
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100.h,
                          height: 150.h,
                          child: BounceInUp(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                  disabledForegroundColor: Colors.black,
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder()),
                              onPressed: () async {
                                Uint8List imageBytes = await _capturePng();
                                final pdf = await generateKhmerPdf(imageBytes);
                                printDirectlyToPrinter(context, pdf);
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.print,
                                    size: 50.h,
                                  ),
                                  Text("បោះពុម្ភ")
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100.h,
                          height: 150.h,
                          child: BounceInUp(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                  disabledForegroundColor: Colors.black,
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder()),
                              onPressed: () {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.warning,
                                  cancelBtnText: "បោះបង់",
                                  confirmBtnText: "ចង់ចាកចេញ",
                                  text: "តើអ្នកចង់ចាកចេញមែនទេ?",
                                  showCancelBtn: true,
                                  onConfirmBtnTap: () {
                                    Get.back();
                                    Get.back();
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    size: 50.h,
                                  ),
                                  Text("ចាកចេញ")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  List<RowTablePrintWidget> allSale() {
    List<RowTablePrintWidget> rows = [];
    for (int i = 0; i < manageInvoiceController.choseAreas.length; i++) {
      RowTablePrintWidget row = RowTablePrintWidget(
        number: '${i + 1}',
        clienID: manageInvoiceController.choseAreas[i].clientID,
        clientName: manageInvoiceController.choseAreas[i].clientName,
        store: manageInvoiceController.choseAreas[i].store,
        code: manageInvoiceController.choseAreas[i].code,
        old: manageInvoiceController.choseAreas[i].oldCans.toString(),
        newProduct: manageInvoiceController.choseAreas[i].newCans.toString(),
        change: "0",
        amount: manageInvoiceController.choseAreas[i].amount.toStringAsFixed(2),
        backProduct: "",
        orther: "",
        payment: "",
        date: "",
      );
      rows.add(row);
    }
    return rows;
  }
}
