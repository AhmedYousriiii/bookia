import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_App.dart';
import 'package:boookia/features/cart/data/model/response/cart_model_response/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cartwidget extends StatefulWidget {
  const Cartwidget({
    super.key,
    required this.cartitem,
    required this.onAdd,
    required this.onRemove,
    required this.onminus,
  });
  final CartItem cartitem;
  final Function() onAdd;
  final Function() onminus;
  final Function() onRemove;

  @override
  State<Cartwidget> createState() => _CartwidgetState();
}

class _CartwidgetState extends State<Cartwidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.cartitem.itemProductImage ?? "",
              height: 100,
              width: 118,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      widget.cartitem.itemProductName ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: get16text(color: Color(0xff606060)),
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: widget.onRemove,
                      icon: SvgPicture.asset(
                        'assets/icons/Shape.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
                Text(
                  "${widget.cartitem.itemProductDiscount ?? 0}",
                  style: get20text(),
                ),
                SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: widget.onminus,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: ColorApp.bordercolor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        widget.cartitem.itemQuantity.toString(),
                        textAlign: TextAlign.center,
                        style: get16text(),
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onAdd,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: ColorApp.bordercolor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
