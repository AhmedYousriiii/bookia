import 'dart:ui';

import 'package:boookia/core/function/dilogs.dart';
import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/regex.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:boookia/features/auth/presentation/page/password_success.dart';
import 'package:boookia/features/cart/data/model/request/place_order_prams.dart';

import 'package:boookia/features/cart/data/model/response/getgovernorates/get_governorates.dart';
import 'package:boookia/features/home/presentation/bloc/home_bloc.dart';
import 'package:boookia/features/home/presentation/bloc/home_event.dart';
import 'package:boookia/features/home/presentation/bloc/home_state.dart';

import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({
    super.key,
    required this.total,
  });
  final String total;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var Addresscontroller = TextEditingController();
  var Phonecontroller = TextEditingController();
  var govontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();
  int? governorateId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is PlaceOrderLoadingState) {
          showLoadingDialog(context);
          Navigator.pop(context);
        } else if (state is HomeerroState) {
          Navigator.pop(context);
          showMessageDialog(context, "${state.message}");
        } else {
          pushReplacement(context, PasswordChanged());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Checkout",
              style: get20text(),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Text(
                          "Total:",
                          style: get15text(color: ColorApp.darkgraycolor, fontsize: 20, fontweight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "${widget.total} \$",
                          style: get20text(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonApp(
                    text: "Submit Order",
                    onpress: () {
                      if (formkey.currentState!.validate()) {
                        context.read<HomeBloc>().add(
                              PlaceOrderEvent(
                                Prams: PlaceOrderPrams(
                                  address: Addresscontroller.text,
                                  email: emailcontroller.text,
                                  name: namecontroller.text,
                                  phone: Phonecontroller.text,
                                  governorateId: governorateId,
                                ),
                              ),
                            );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 10),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "name is required";
                      }
                    },
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      hintStyle: get15text(),
                      fillColor: Color(0xffE8ECF4).withOpacity(.4),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "email is required";
                      } else if ((!regexemail(value))) {
                        return "please enter valid email";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: get15text(),
                      fillColor: Color(0xffE8ECF4).withOpacity(.4),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: Addresscontroller,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "Address is required";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle: get15text(),
                      fillColor: Color(0xffE8ECF4).withOpacity(.4),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: Phonecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "phone is required";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Phone",
                      hintStyle: get15text(),
                      fillColor: Color(0xffE8ECF4).withOpacity(.4),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  DropdownMenu(
                    controller: govontroller,
                    enableSearch: true,
                    hintText: "shoose governorate",
                    expandedInsets: EdgeInsets.all(0),
                    menuStyle: MenuStyle(backgroundColor: WidgetStatePropertyAll(ColorApp.secondarycolor)),
                    inputDecorationTheme: InputDecorationTheme(
                      fillColor: Color(0xffE8ECF4).withOpacity(.4),
                      filled: true,
                    ),
                    onSelected: (value) {
                      governorateId = value;
                    },
                    dropdownMenuEntries: governdata.map(
                      (e) {
                        return DropdownMenuEntry(value: e["id"], label: e["governorate_name_en"]);
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: 12,
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
