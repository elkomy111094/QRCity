import 'dart:math';

import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/View_Models/notes_view_model/notes_cubit.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:sizer/sizer.dart';

class NotesScreen extends StatefulWidget {
  BuildContext navBarContext;

  NotesScreen({required this.navBarContext});

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  DateTime? selectedDate;
  Random random = new Random();

  @override
  void initState() {
    setState(() {
      selectedDate = DateTime.now();
    });
    super.initState();
  }

  void addNewBottomSheet(BuildContext context) {
    showModalBottomSheet(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.h), topLeft: Radius.circular(5.h)),
        ),
        context: context,
        builder: (builder) {
          return BlocConsumer<NotesCubit, NotesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              NotesCubit notesCubitInst = NotesCubit.get(context);

              return Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 2.h, left: 5.w, right: 5.w, bottom: 1.h),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "إضافة عنصر جديد",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Taga",
                                fontSize: 15.sp),
                          ),
                          Container(
                            height: 6.h,
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "العنصر",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Taga",
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Text(
                                      "العدد",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Taga",
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Text(
                                      "التكلفه",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Taga",
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Text(
                                      "الاجمالي",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Taga",
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Probleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeem Here

                          Container(
                            height: 25.h,
                            width: double.infinity,
                            child: ListView.separated(
                                reverse: notesCubitInst.newNotesList.length > 1
                                    ? true
                                    : false,
                                itemBuilder: (context, index) {
                                  return index ==
                                          notesCubitInst.newNotesList.length
                                      ? Form(
                                          key: notesCubitInst.addingNewFormKey,
                                          child: Container(
                                            height: 10.h,
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: 7.h,
                                                      child: SquareTextField(
                                                        fillColor: kLightWhite,
                                                        validator: (value) {
                                                          value = value!
                                                              .replaceAll(
                                                                  " ", "");
                                                          if (value.isEmpty) {
                                                            return "فارغ";
                                                          }
                                                        },
                                                        hintText: "",
                                                        onChanged: (phone) {},
                                                        controller: notesCubitInst
                                                            .noteNameController,
                                                        keyBoardType:
                                                            TextInputType.name,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.w),
                                                    child: SizedBox(
                                                      height: 7.h,
                                                      width: 7.h,
                                                      child: SquareTextField(
                                                        fillColor: kLightWhite,
                                                        hintText: "",
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return "فارغ";
                                                          } else if (value ==
                                                              "0") {
                                                            return "كميه قليله";
                                                          }
                                                        },
                                                        controller: notesCubitInst
                                                            .noteCountController,
                                                        onChanged: (value) {
                                                          if (value.isEmpty ||
                                                              notesCubitInst
                                                                  .notePriceController
                                                                  .text
                                                                  .isEmpty) {
                                                          } else {
                                                            notesCubitInst.CaluateNewNoteTotalPrice(
                                                                price: int.parse(
                                                                    notesCubitInst
                                                                        .notePriceController
                                                                        .text),
                                                                count:
                                                                    int.parse(
                                                                        value));
                                                          }
                                                        },
                                                        keyBoardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.w),
                                                    child: SizedBox(
                                                      height: 7.h,
                                                      width: 7.h,
                                                      child: SquareTextField(
                                                        fillColor: kLightWhite,
                                                        controller: notesCubitInst
                                                            .notePriceController,
                                                        hintText: "",
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return "فارغ";
                                                          } else if (value ==
                                                              "0") {
                                                            return "سعر قليل";
                                                          }
                                                        },
                                                        onChanged: (value) {
                                                          if (value.isEmpty ||
                                                              notesCubitInst
                                                                  .noteCountController
                                                                  .text
                                                                  .isEmpty) {
                                                          } else {
                                                            notesCubitInst.CaluateNewNoteTotalPrice(
                                                                price:
                                                                    int.parse(
                                                                        value),
                                                                count: int.parse(
                                                                    notesCubitInst
                                                                        .noteCountController
                                                                        .text));
                                                          }
                                                        },
                                                        keyBoardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.w),
                                                    child: Container(
                                                      height: 6.h,
                                                      width: 9.h,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.h)),
                                                      child: Center(
                                                          child: Text(
                                                              notesCubitInst
                                                                  .total
                                                                  .toString())),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 7.h,
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 7.h,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.h)),
                                                      child: Center(
                                                        child: Text(
                                                            notesCubitInst
                                                                .newNotesList[
                                                                    index]
                                                                .name
                                                                .toString()),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.w),
                                                  child: SizedBox(
                                                    height: 7.h,
                                                    width: 7.h,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.h)),
                                                      child: Center(
                                                        child: Text(
                                                            notesCubitInst
                                                                .newNotesList[
                                                                    index]
                                                                .count
                                                                .toString()),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.w),
                                                  child: SizedBox(
                                                    height: 7.h,
                                                    width: 7.h,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.h)),
                                                      child: Center(
                                                        child: Text(
                                                            notesCubitInst
                                                                .newNotesList[
                                                                    index]
                                                                .price
                                                                .toString()),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.w),
                                                  child: Container(
                                                    height: 6.h,
                                                    width: 9.h,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.h)),
                                                    child: Center(
                                                        child: Text(
                                                            notesCubitInst
                                                                .newNotesList[
                                                                    index]
                                                                .total
                                                                .toString())),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 1.h,
                                  );
                                },
                                itemCount:
                                    notesCubitInst.newNotesList.length + 1),
                          ),

                          //---------------------------------------------------------------------------------
                          SizedBox(
                            height: 1.h,
                          ),
                          InkWell(
                            onTap: () {
                              if (notesCubitInst.addingNewFormKey.currentState!
                                  .validate()) {
                                notesCubitInst.addNoteToListOfAddingNewNotes();
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: DottedBorder(
                                color: kBlue,
                                strokeWidth: 1,
                                strokeCap: StrokeCap.butt,
                                child: Container(
                                  width: double.infinity,
                                  height: 6.h,
                                  child: Center(
                                    child: Text(
                                      "إضافة عنصر أخر",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Taga",
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.h),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomTextButton(
                              buttonColor: kDarkBlue,
                              textColor: Colors.white,
                              buttonHorizontalPaddingval: 5.w,
                              buttonVerticalPaddingVal: 0,
                              roundedBorder: 1.h,
                              textSize: 12.sp,
                              onPressed: () {
                                if (notesCubitInst
                                    .addingNewFormKey.currentState!
                                    .validate()) {
                                  notesCubitInst.saveMyNewNotes();
                                  pop(context);
                                }
                              },
                              text: "حفظ"),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NotesCubit notesCubitInst = NotesCubit.get(context);
        return SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: kDarkBlue.withOpacity(.5),
                child: Center(
                  child: Icon(Icons.add),
                ),
                onPressed: () {
                  addNewBottomSheet(context);
                },
              ),
              resizeToAvoidBottomInset: false,
              appBar: CalendarAppBar(
                fullCalendar: false,
                accent: kDarkBlue,
                backButton: false,
                onDateChanged: (value) => setState(() => selectedDate = value),
                lastDate: DateTime.now(),
                events: List.generate(100, (index) => DateTime.now()),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 3.h,
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7.w,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "العنصر",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Taga",
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              "العدد",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Taga",
                                  fontSize: 12.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              "التكلفه",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Taga",
                                  fontSize: 12.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              "الاجمالي",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Taga",
                                  fontSize: 12.sp),
                            ),
                          ),
                          SizedBox(
                            width: 11.w,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 24.h,
                    width: double.infinity,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 4.h,
                            child: Center(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        notesCubitInst
                                            .addNoteToCompletedList(index);
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.arrowDown,
                                        color: Colors.green,
                                      )),
                                  Expanded(
                                    child: SizedBox(
                                      height: 7.h,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(2.h)),
                                        child: Center(
                                          child: Text(notesCubitInst
                                              .unCompletedNotesList[index].name
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    child: SizedBox(
                                      height: 7.h,
                                      width: 7.h,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(2.h)),
                                        child: Center(
                                          child: Text(notesCubitInst
                                              .unCompletedNotesList[index].count
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    child: SizedBox(
                                      height: 7.h,
                                      width: 7.h,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(2.h)),
                                        child: Center(
                                          child: Text(notesCubitInst
                                              .unCompletedNotesList[index].price
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    child: Container(
                                      height: 6.h,
                                      width: 9.h,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(2.h)),
                                      child: Center(
                                          child: Text(notesCubitInst
                                              .unCompletedNotesList[index].total
                                              .toString())),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        notesCubitInst
                                            .removeNoteFromUnCompleteList(
                                                index);
                                      },
                                      icon: Icon(
                                        Icons.clear,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.h,
                          );
                        },
                        itemCount: notesCubitInst.unCompletedNotesList.length),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                    child: Text(
                      "العناصر المكتمله",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Taga",
                          fontSize: 12.sp),
                    ),
                  ),
                  Container(
                    height: 24.h,
                    width: double.infinity,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 4.h,
                            child: Center(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        notesCubitInst
                                            .backNoteFromCompletedToUnCompletedList(
                                                index);
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.arrowUp,
                                        color: Colors.green,
                                      )),
                                  Expanded(
                                    child: SizedBox(
                                      height: 7.h,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(2.h)),
                                        child: Center(
                                          child: Text(notesCubitInst
                                              .completedNotesList[index].name
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    child: SizedBox(
                                      height: 7.h,
                                      width: 7.h,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(2.h)),
                                        child: Center(
                                          child: Text(notesCubitInst
                                              .completedNotesList[index].count
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    child: SizedBox(
                                      height: 7.h,
                                      width: 7.h,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(2.h)),
                                        child: Center(
                                          child: Text(notesCubitInst
                                              .completedNotesList[index].price
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    child: Container(
                                      height: 6.h,
                                      width: 9.h,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(2.h)),
                                      child: Center(
                                          child: Text(notesCubitInst
                                              .completedNotesList[index].total
                                              .toString())),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.h,
                          );
                        },
                        itemCount: notesCubitInst.completedNotesList.length),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
