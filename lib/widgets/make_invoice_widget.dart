import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:interview_test/controllers/controller.dart';
import 'package:interview_test/widgets/empty_page_widget.dart';
import 'package:interview_test/widgets/manage_invoice_widget.dart';
import 'package:interview_test/widgets/side_bar_menu_widgets.dart';

class MakeInvoiceWidget extends StatelessWidget {
  const MakeInvoiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: Obx(
        () => Row(
          children: [
            //Left Bar
            Container(
              width: 220.h,
              height: double.infinity,
              padding: EdgeInsets.only(
                left: 12.h,
                top: 20.h,
              ),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.black26),
                ),
                color: Colors.white60,
              ),
              child: FadeInLeft(
                child: ListView(
                  children: [
                    Text("វិក្ក័យបត្រ"),
                    Column(
                      children: [
                        SideBarMenuWidget(
                            title: "វិក្ក័យប័ត្រថ្មី",
                            icon: Icons.edit_document,
                            onTap: () {
                              fetureController.feture.value = "abc";
                            }),
                        SideBarMenuWidget(
                            title: "វិក្ក័យប័ត្រចាស់",
                            icon: Icons.edit_document,
                            onTap: () {
                              fetureController.feture.value = "abc";
                            }),
                        SideBarMenuWidget(
                            title: "វិក្ក័យប័ត្រដូរ",
                            icon: Icons.edit_document,
                            onTap: () {
                              fetureController.feture.value = "abc";
                            }),
                        SideBarMenuWidget(
                            title: "វិក្ក័យប័ត្រត្រឡប់",
                            icon: Icons.edit_document,
                            onTap: () {
                              fetureController.feture.value = "abc";
                            }),
                        SideBarMenuWidget(
                            title: "បែងចែកវិក្ក័យប័ត្រ",
                            icon: Icons.menu_book_outlined,
                            onTap: () {
                              fetureController.feture.value = "MANAGE_INOICE";
                            }),
                        SideBarMenuWidget(
                            title: "វិក្ក័យប័ត្រចេញ",
                            icon: Icons.outbox,
                            onTap: () {
                              fetureController.feture.value = "abc";
                            }),
                        SideBarMenuWidget(
                          onTap: () {
                            fetureController.feture.value = "abc";
                          },
                          title: "របាយការណ៍វិក្ក័យប័ត្រ",
                          icon: Icons.add_chart,
                        ),
                      ],
                    ),
                    Text("របាយការណ៍ប្រចាំថ្ងៃ"),
                    Column(
                      children: [
                        SideBarMenuWidget(
                          onTap: () {
                            fetureController.feture.value = "abc";
                          },
                          title: "របាយការណ៍ចែកផ្លូវ",
                          icon: Icons.calendar_today_rounded,
                        ),
                        SideBarMenuWidget(
                          onTap: () {
                            fetureController.feture.value = "abc";
                          },
                          title: "របាយការណ៍វិក្ក័យប័ត្រថ្មី",
                          icon: Icons.pie_chart,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //Contents
            fetureController.feture.value == "MANAGE_INOICE"
                ? ManageInvoiceWiget()
                : Expanded(child: EmptyPageWidget()),
          ],
        ),
      ),
    );
  }
}
