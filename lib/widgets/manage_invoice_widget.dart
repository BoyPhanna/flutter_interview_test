import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:interview_test/controllers/controller.dart';
import 'package:interview_test/pages/preview_befor_print_page.dart';
import 'package:interview_test/utils/print_pdf.dart';
import 'package:interview_test/widgets/column_body_widget.dart';
import 'package:interview_test/widgets/column_header_widget.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ManageInvoiceWiget extends StatefulWidget {
  const ManageInvoiceWiget({super.key});

  @override
  State<ManageInvoiceWiget> createState() => _ManageInvoiceWigetState();
}

class _ManageInvoiceWigetState extends State<ManageInvoiceWiget> {
  List<String> positions = ["វេងស្រេង", "ត្រឡោកបែក", "វត្ដភ្នំ", "ក្រចេះ"];
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        manageInvoiceController.dateInvoice = selectedDate!;
      });
  }

  @override
  void initState() {
    selectedDate = DateTime.now();
    manageInvoiceController.dateInvoice = selectedDate!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      width: double.infinity,
                      height: 60.h,
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder()),
                            onPressed: () {
                              if (manageInvoiceController.driverIndex >= 0) {
                                QuickAlert.show(
                                  onConfirmBtnTap: () {
                                    // final pdf = await generateKhmerPdf();
                                    Navigator.pop(context);
                                    // showPdfPreview(context, pdf);
                                    Get.to(() => PreviewBeforPrintPage());
                                  },
                                  context: context,
                                  type: QuickAlertType.confirm,
                                  title: "រក្សាទុកនិងបោះពុម្ភ",
                                  text: 'តើអ្នកចង់បោះពុម្ភមែនទេ?',
                                  confirmBtnText: 'ចង់',
                                  cancelBtnText: 'អត់ទេ',
                                );
                              } else {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.warning,
                                  title: "មិនទាន់អាចរក្សាទុកបានទេ",
                                  text: "សូមជ្រើរើសអ្នកដឹកជញ្ជូនម្នាក់ជាមុនសិន",
                                  showCancelBtn: false,
                                  showConfirmBtn: true,
                                  confirmBtnText: "យល់ព្រម",
                                );
                              }
                            },
                            child: Icon(Icons.print),
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          Text("រក្សាទុកនិងបោះពុម្ភ"),
                          SizedBox(
                            width: 10.h,
                          ),
                          Text("កាលបរិច្ឋេទចេញវិក្ក័យប័ត្រ"),
                          SizedBox(
                            width: 10.h,
                          ),
                          Text(
                            selectedDate == null
                                ? 'No date selected!'
                                : '${selectedDate!.toLocal()}'.split(' ')[0],
                          ),
                          SizedBox(width: 20.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder()),
                            onPressed: () {
                              _selectDate(context);
                            },
                            child: Icon(Icons.date_range),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          FadeInUp(
                            child: Container(
                              width: 200.h,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black45),
                                  left: BorderSide(color: Colors.black45),
                                  right: BorderSide(color: Colors.black45),
                                  top: BorderSide(color: Colors.black45),
                                ),
                                color: Colors.white70,
                              ),
                              child: Column(
                                children: [
                                  Text("តំបន់"),
                                  Expanded(
                                      child: Container(
                                    child: ListView.builder(
                                      itemCount:
                                          manageInvoiceController.areas.length,
                                      itemBuilder: (context, index) {
                                        return ZoomTapAnimation(
                                          onTap: () {
                                            manageInvoiceController
                                                .choseAreaToShowClient(index);
                                          },
                                          child: Container(
                                            height: 30.h,
                                            width: double.infinity,
                                            color: index % 2 == 0
                                                ? Colors.white
                                                : Colors.white38,
                                            child: Row(
                                              children: [
                                                Icon(Icons.gps_fixed),
                                                SizedBox(
                                                  width: 10.h,
                                                ),
                                                Text(
                                                    "${manageInvoiceController.areas[index].areaName}"),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black45),
                                        left: BorderSide(color: Colors.black45),
                                        right:
                                            BorderSide(color: Colors.black45),
                                        top: BorderSide(color: Colors.black45),
                                      ),
                                      color: Colors.white70,
                                    ),
                                    child: Column(
                                      children: [
                                        //header show client in area
                                        Container(
                                          width: double.infinity,
                                          height: 35.h,
                                          child: Row(
                                            children: [
                                              ColumnHeaderWidget(
                                                width: 59,
                                                title: "ជ្រើសរើស",
                                              ),
                                              ColumnHeaderWidget(
                                                width: 130,
                                                title: "លេខកូដអតិថិជន",
                                              ),
                                              ColumnHeaderWidget(
                                                width: 130,
                                                title: "ឈ្មោះអតិថិជន",
                                              ),
                                              ColumnHeaderWidget(
                                                width: 80,
                                                title: "កូដ",
                                              ),
                                              ColumnHeaderWidget(
                                                width: 100,
                                                title: "ទឹកលុយ",
                                              ),
                                              ColumnHeaderWidget(
                                                width: 130,
                                                title: "តំបន់",
                                              ),
                                              ColumnHeaderWidget(
                                                width: 90,
                                                title: "ផ្សារ",
                                              ),
                                              ColumnHeaderWidget(
                                                width: 89,
                                                title: "តូប",
                                              ),
                                            ],
                                          ),
                                        ),
                                        //body show client in area
                                        Expanded(
                                          child: Obx(
                                            () => Container(
                                              width: double.infinity,
                                              child: ListView.builder(
                                                  itemCount:
                                                      manageInvoiceController
                                                          .showAreas[0]
                                                          .clients
                                                          .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    Color color = index % 2 == 0
                                                        ? Colors.white54
                                                        : Colors.black12;
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 35,
                                                      child: Row(
                                                        children: [
                                                          ColumnBodyWidget(
                                                              width: 59,
                                                              child: Checkbox(
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  manageInvoiceController
                                                                      .showAreas[
                                                                          0]
                                                                      .clients[
                                                                          index]
                                                                      .chose = value!;
                                                                  setState(
                                                                      () {});
                                                                },
                                                                value: manageInvoiceController
                                                                    .showAreas[
                                                                        0]
                                                                    .clients[
                                                                        index]
                                                                    .chose,
                                                              ),
                                                              color: color),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              if (manageInvoiceController
                                                                  .showAreas[0]
                                                                  .clients[
                                                                      index]
                                                                  .chose) {
                                                                manageInvoiceController
                                                                    .choseAreaToMakeInvoice(
                                                                        index);
                                                                setState(() {});
                                                              } else {
                                                                QuickAlert.show(
                                                                  context:
                                                                      context,
                                                                  type:
                                                                      QuickAlertType
                                                                          .info,
                                                                  title:
                                                                      "ការណែនាំ",
                                                                  text:
                                                                      "ប្រសិនបើអ្នកចង់ Select សូមធ្វើការ Click ជ្រើសរើស លើប្រអប់ជាមុនសិនទើបអាច Select បាន។",
                                                                  confirmBtnText:
                                                                      "យល់ព្រម",
                                                                );
                                                              }
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shadowColor: Colors
                                                                  .transparent,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                ColumnBodyWidget(
                                                                    width: 130,
                                                                    child: Text(
                                                                        "${manageInvoiceController.showAreas[0].clients[index].clientID}"),
                                                                    color:
                                                                        color),
                                                                ColumnBodyWidget(
                                                                    width: 130,
                                                                    child: Text(
                                                                        "${manageInvoiceController.showAreas[0].clients[index].clientName}"),
                                                                    color:
                                                                        color),
                                                                ColumnBodyWidget(
                                                                    width: 80,
                                                                    child: Text(
                                                                        "${manageInvoiceController.showAreas[0].clients[index].code}"),
                                                                    color:
                                                                        color),
                                                                ColumnBodyWidget(
                                                                    width: 100,
                                                                    child: Text(
                                                                        "${manageInvoiceController.showAreas[0].clients[index].amount}"),
                                                                    color:
                                                                        color),
                                                                ColumnBodyWidget(
                                                                    width: 130,
                                                                    child: Text(
                                                                        "${manageInvoiceController.showAreas[0].clients[index].area}"),
                                                                    color:
                                                                        color),
                                                                ColumnBodyWidget(
                                                                    width: 90,
                                                                    child: Text(
                                                                        "${manageInvoiceController.showAreas[0].clients[index].market}"),
                                                                    color:
                                                                        color),
                                                                ColumnBodyWidget(
                                                                    width: 89,
                                                                    child: Text(
                                                                        "${manageInvoiceController.showAreas[0].clients[index].store}"),
                                                                    color:
                                                                        color),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            color: Colors.black38,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.only(
                                                    top: 5.h, bottom: 5.h),
                                                width: 100.h,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Obx(() => Text(
                                                    "សរុប៖ ${manageInvoiceController.totalAmountInArear.value.toStringAsFixed(2)}  \$")),
                                              ),
                                              SizedBox(
                                                width: 10.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      height: 200.h,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom:
                                              BorderSide(color: Colors.black45),
                                          left:
                                              BorderSide(color: Colors.black45),
                                          right:
                                              BorderSide(color: Colors.black45),
                                          top:
                                              BorderSide(color: Colors.black45),
                                        ),
                                        color: Colors.white70,
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              child: Column(
                                                children: [
                                                  //header select client in area to make invoice
                                                  Container(
                                                    width: double.infinity,
                                                    height: 35,
                                                    child: Row(
                                                      children: [
                                                        ColumnHeaderWidget(
                                                          width: 130,
                                                          title:
                                                              "លេខកូដអតិថិជន",
                                                        ),
                                                        ColumnHeaderWidget(
                                                          width: 130,
                                                          title: "ឈ្មោះអតិថិជន",
                                                        ),
                                                        ColumnHeaderWidget(
                                                          width: 80,
                                                          title: "កូដ",
                                                        ),
                                                        ColumnHeaderWidget(
                                                          width: 100,
                                                          title: "ទឹកលុយ",
                                                        ),
                                                        ColumnHeaderWidget(
                                                          width: 89,
                                                          title: "ប្រភេទកំប៉ុង",
                                                        ),
                                                        ColumnHeaderWidget(
                                                          width: 90,
                                                          title: "ផ្សារ",
                                                        ),
                                                        ColumnHeaderWidget(
                                                          width: 130,
                                                          title: "តំបន់",
                                                        ),
                                                        ColumnHeaderWidget(
                                                          width: 59,
                                                          title: "ដកចេញ",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //body select client to make invoice
                                                  Expanded(
                                                    child: Obx(
                                                      () => Container(
                                                        width: double.infinity,
                                                        child: ListView.builder(
                                                            itemCount:
                                                                manageInvoiceController
                                                                    .choseAreas
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              Color color = index %
                                                                          2 ==
                                                                      0
                                                                  ? Colors
                                                                      .white54
                                                                  : Colors
                                                                      .black12;
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 35.h,
                                                                child: Row(
                                                                  children: [
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {},
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        shadowColor:
                                                                            Colors.transparent,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        padding:
                                                                            EdgeInsets.all(0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          ColumnBodyWidget(
                                                                              width: 130,
                                                                              child: Text("${manageInvoiceController.choseAreas[index].clientID}"),
                                                                              color: color),
                                                                          ColumnBodyWidget(
                                                                              width: 130,
                                                                              child: Text("${manageInvoiceController.choseAreas[index].clientName}"),
                                                                              color: color),
                                                                          ColumnBodyWidget(
                                                                              width: 80,
                                                                              child: Text("${manageInvoiceController.choseAreas[index].code}"),
                                                                              color: color),
                                                                          ColumnBodyWidget(
                                                                              width: 100,
                                                                              child: Text("${manageInvoiceController.choseAreas[index].amount}"),
                                                                              color: color),
                                                                          ColumnBodyWidget(
                                                                              width: 89,
                                                                              child: Text("${manageInvoiceController.choseAreas[index].cansType}"),
                                                                              color: color),
                                                                          ColumnBodyWidget(
                                                                              width: 90,
                                                                              child: Text("${manageInvoiceController.choseAreas[index].market}"),
                                                                              color: color),
                                                                          ColumnBodyWidget(
                                                                              width: 130,
                                                                              child: Text("${manageInvoiceController.choseAreas[index].area}"),
                                                                              color: color),
                                                                          ColumnBodyWidget(
                                                                              width: 59,
                                                                              child: ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(
                                                                                  shadowColor: Colors.transparent,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  padding: EdgeInsets.all(0),
                                                                                ),
                                                                                onPressed: () {
                                                                                  manageInvoiceController.removeChoseArea(index);
                                                                                  setState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.remove,
                                                                                  color: Colors.red,
                                                                                ),
                                                                              ),
                                                                              color: color)
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: 35.h,
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  margin: EdgeInsets.only(
                                                      top: 5.h, bottom: 5.h),
                                                  width: 100.h,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  child: Obx(() => Text(
                                                      "សរុប៖ ${manageInvoiceController.totalAmountChoseMakeInvoice.value.toStringAsFixed(2)} \$")),
                                                ),
                                                SizedBox(
                                                  width: 10.h,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  margin: EdgeInsets.only(
                                                      top: 5.h, bottom: 5.h),
                                                  width: 100.h,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  child: Obx(() => Text(
                                                      "ចំនួនកំប៉ុង៖ ${manageInvoiceController.totalNewCans.value}")),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),

            //right bar
            Container(
              width: 240.h,
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.black54)),
                color: Colors.white38,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 60.h,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black54)),
                      color: Colors.white38,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.h,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                              ),
                            ),
                            height: 50.h,
                            child: TextField(
                              onChanged: (value) {
                                manageInvoiceController
                                    .searchDriverByName(value);
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        ZoomTapAnimation(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                              ),
                            ),
                            width: 50.h,
                            height: 50.h,
                            child: Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 40.h,
                          child: Row(
                            children: [
                              Container(
                                width: 60.h,
                                height: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.black45),
                                    left: BorderSide(color: Colors.black45),
                                    right: BorderSide(color: Colors.black45),
                                    top: BorderSide(color: Colors.black45),
                                  ),
                                ),
                                child: Text("ជ្រើសរើស"),
                              ),
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.black45),
                                      left: BorderSide(color: Colors.black45),
                                      right: BorderSide(color: Colors.black45),
                                      top: BorderSide(color: Colors.black45),
                                    ),
                                  ),
                                  child: Text("ឈ្មោះអ្នដឹកជញ្ជូន"),
                                ),
                              ),
                              Container(
                                width: 60.h,
                                height: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.black45),
                                    left: BorderSide(color: Colors.black45),
                                    right: BorderSide(color: Colors.black45),
                                    top: BorderSide(color: Colors.black45),
                                  ),
                                ),
                                child: Text("រូបភាព"),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount:
                                  manageInvoiceController.searchDrivers.length,
                              itemBuilder: (context, index) {
                                Color color = index % 2 == 0
                                    ? Colors.white
                                    : Colors.black12;
                                return Container(
                                  width: double.infinity,
                                  height: 40.h,
                                  child: Row(
                                    children: [
                                      ColumnBodyWidget(
                                          width: 60,
                                          child: Checkbox(
                                            value: manageInvoiceController
                                                .searchDrivers[index].chose,
                                            onChanged: (bool? value) {
                                              print(index);
                                              manageInvoiceController
                                                  .choseDriver(index);

                                              setState(() {});
                                            },
                                          ),
                                          color: color),
                                      Expanded(
                                        child: ColumnBodyWidget(
                                          child: Text(
                                              "${manageInvoiceController.searchDrivers[index].driverName}"),
                                          width: double.infinity,
                                          color: color,
                                        ),
                                      ),
                                      ColumnBodyWidget(
                                        width: 60.h,
                                        color: color,
                                        child: Padding(
                                          padding: EdgeInsets.all(5.h),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/${manageInvoiceController.searchDrivers[index].image}"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
