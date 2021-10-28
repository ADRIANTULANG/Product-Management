import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/homeview/home_controller.dart';
import 'package:myapp/helpers/endpoints.dart';
import 'package:myapp/helpers/sizer.dart';

class HomeFoodView extends GetView<HomeController> {
  const HomeFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = Sizer();
    return Container(
      alignment: Alignment.center,
      child: Obx(
        () => controller.isLoading.value == true
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: controller.foodList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(
                        top: s.height(context: context, height: 2),
                        left: s.width(context: context, width: 3)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: s.height(context: context, height: 10),
                          width: s.width(context: context, width: 25),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('$endPointImage/food.jpg'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(
                          width: s.width(context: context, width: 2),
                        ),
                        Container(
                          // color: Colors.lime,
                          width: s.width(context: context, width: 50),
                          height: s.height(context: context, height: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  controller.foodList[index].itemName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: s.font(
                                          context: context, fontsize: 20)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  controller.foodList[index].itemDescription,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: s.font(
                                          context: context, fontsize: 10),
                                      color: Colors.grey[500]),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "₱ " + controller.foodList[index].itemPrice,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: s.font(
                                          context: context, fontsize: 10),
                                      color: Colors.grey[500]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: PopupMenuButton(
                              icon: Icon(Icons.more_vert),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text(
                                        "Delete",
                                        style:
                                            TextStyle(color: Colors.red[500]),
                                      ),
                                      // value: 1,
                                      onTap: () {
                                        controller.deleteConfirmation(
                                          itemType: "Food",
                                          itemID:
                                              controller.foodList[index].itemid,
                                        );
                                      },
                                    ),
                                    PopupMenuItem(
                                      child: Text(
                                        "Update",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      // value: 2,
                                      onTap: () {
                                        controller.showDialog(
                                          itemType: "Food",
                                          itemDescription: controller
                                              .foodList[index].itemDescription,
                                          itemID:
                                              controller.foodList[index].itemid,
                                          itemName: controller
                                              .foodList[index].itemName,
                                          itemPrice: controller
                                              .foodList[index].itemPrice,
                                        );
                                      },
                                    ),
                                  ]),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
