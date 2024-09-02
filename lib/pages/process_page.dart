import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:interview_test/controllers/controller.dart';
import 'package:interview_test/widgets/empty_page_widget.dart';
import 'package:interview_test/widgets/make_invoice_widget.dart';
import 'package:interview_test/widgets/manage_invoice_widget.dart';
import 'package:interview_test/widgets/menu_of_tap_widget.dart';
import 'package:interview_test/widgets/side_bar_menu_widgets.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({super.key});

  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Header
          Container(
            decoration: BoxDecoration(color: Colors.white60),
            width: double.infinity,
            height: 100.h,
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //tap1
                  Container(
                    height: double.infinity,
                    padding: EdgeInsets.only(right: 10.h, left: 10.h),
                    width: 220.h,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black26),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MenuOfTapWidget(
                                title: "ចេញវិកយបត្រ",
                                onTap: () {
                                  fetureController.menu.value = "ចេញវិកយបត្រ";
                                },
                                width: 70.h,
                                height: 70.h,
                                icon: Icons.receipt,
                              ),
                              MenuOfTapWidget(
                                title: "ទូទាត់វិក្ក័យប័ត្រ",
                                width: 70.h,
                                height: 70.h,
                                icon: Icons.payments_outlined,
                                onTap: () {
                                  fetureController.menu.value = "";
                                },
                              ),
                            ],
                          ),
                        ),
                        Text("ទូទាត់ប្រចាំថ្ងៃ"),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  //tap2
                  Container(
                    height: double.infinity,
                    width: 300.h,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black26),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MenuOfTapWidget(
                                title: "ដាក់ស្នើរប្រចាំថ្ងៃ",
                                width: 70.h,
                                height: 70.h,
                                icon: Icons.add_comment_rounded,
                                onTap: () {
                                  fetureController.menu.value = "";
                                },
                              ),
                              MenuOfTapWidget(
                                title: "ត្រួតពិនិត្យការដាក់ស្នើរប្រចាំថ្ងៃ",
                                width: 200.h,
                                height: 70.h,
                                icon: Icons.checklist_rounded,
                                onTap: () {
                                  fetureController.menu.value = "";
                                },
                              ),
                            ],
                          ),
                        ),
                        Text("ដាក់ស្នើរ"),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  //tap3
                  Container(
                    height: double.infinity,
                    width: 320.h,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black26),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MenuOfTapWidget(
                                title: "ផ្ទៀងផ្ទាត់វិក្ក័យបត្រ",
                                width: 200.h,
                                height: 60.h,
                                onTap: () {
                                  fetureController.menu.value = "";
                                },
                              ),
                            ],
                          ),
                        ),
                        Text("សវនកម្ម"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Obx(
            () => Expanded(
              child: fetureController.menu.value == "ចេញវិកយបត្រ"
                  ? MakeInvoiceWidget()
                  : EmptyPageWidget(),
            ),
          ),

          //Footer
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              width: 200.h,
              height: double.infinity,
              margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Obx(() => Text("${fetureController.menu.value}៖")),
            ),
          ),
        ],
      ),
    );
  }
}
