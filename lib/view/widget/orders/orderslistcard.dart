import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId} ",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!.toString())}"),
              Text("Order Price : ${listdata.ordersPrice} \$ "),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymeentmethod!.toString())} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!.toString())} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersTotalprice} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      // Get.toNamed(AppRoute.ordersdetails,
                      //     arguments: {"ordersmodel": listdata});
                      controller.gotopageOrdersDetails(listdata);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Details"),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.ordersStatus == 0)
                    MaterialButton(
                      onPressed: () {
                        controller.deleteOrder(listdata.ordersId!);
                      },
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      child: const Text("Delete"),
                    ),
                  if (listdata.ordersStatus == 3)
                    MaterialButton(
                      onPressed: () {
                        controller.gotopageTracking(listdata);
                      },
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      child: const Text("Tracking"),
                    )
                ],
              ),
            ],
          )),
    );
  }
}


///////////////////////////////////////////////////////////////////////////
///import 'package:ecommerce/controller/orders/pending_controller.dart';
// import 'package:ecommerce/controller/orders/pending_controller.dart';
// import 'package:ecommerce/core/constant/color.dart';
// import 'package:ecommerce/data/model/ordersmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jiffy/jiffy.dart';

// class CardOrdersList extends GetView<OrdersPendingController> {
//   final OrdersModel order;
//   const CardOrdersList({Key? key, required this.order}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildOrderHeader(),
//             const Divider(),
//             _buildOrderDetails(),
//             const Divider(),
//             _buildActionButtons(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOrderHeader() {
//     return Row(
//       children: [
//         Text(
//           "Order Number : #${order.ordersId} ",
//           style: const TextStyle(
//             fontSize: 18, 
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const Spacer(),
//         Text(
//           Jiffy.parse(order.ordersDatetime!).fromNow(),
//           style: const TextStyle(
//             color: AppColor.primaryColor,
//             fontWeight: FontWeight.bold,
//           ),
//         )
//       ],
//     );
//   }

//   Widget _buildOrderDetails() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildDetailRow("Order Type", controller.printOrderType(order.ordersType.toString())),
//         _buildDetailRow("Order Price", "${order.ordersPrice} \$"),
//         _buildDetailRow("Delivery Price", "${order.ordersPricedelivery} \$"),
//         _buildDetailRow("Payment Method", controller.printPaymentMethod(order.ordersPaymeentmethod.toString())),
//         _buildDetailRow("Order Status", controller.printOrderStatus(order.ordersStatus.toString())),
//       ],
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Text(
//       "$label : $value",
//       style: const TextStyle(fontSize: 16),
//     );
//   }

//   Widget _buildActionButtons() {
//     return Row(
//       children: [
//         Text(
//           "Total Price : ${order.ordersTotalprice} \$ ",
//           style: const TextStyle(
//             color: AppColor.primaryColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const Spacer(),
//         _buildDetailsButton(),
//         const SizedBox(width: 10),
//         if (order.ordersStatus == 0) _buildDeleteButton(),
//         if (order.ordersStatus == 3) _buildTrackingButton(),
//       ],
//     );
//   }

//   Widget _buildDetailsButton() {
//     return MaterialButton(
//       onPressed: () {
//         controller.gotopageOrdersDetails(order);
//       },
//       color: AppColor.thirdColor,
//       textColor: AppColor.secondColor,
//       child: const Text("Details"),
//     );
//   }

//   Widget _buildDeleteButton() {
//     return MaterialButton(
//       onPressed: () {
//         controller.deleteOrder(order.ordersId!);
//       },
//       color: AppColor.thirdColor,
//       textColor: AppColor.secondColor,
//       child: const Text("Delete"),
//     );
//   }

//   Widget _buildTrackingButton() {
//     return MaterialButton(
//       onPressed: () {
//         controller.gotopageTracking(order);
//       },
//       color: AppColor.thirdColor,
//       textColor: AppColor.secondColor,
//       child: const Text("Tracking"),
//     );
//   }
// }
