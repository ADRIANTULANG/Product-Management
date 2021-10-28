import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/homeview/home_controller.dart';
import 'package:myapp/Screens/homeview/home_drinks_view.dart';
import 'package:myapp/Screens/homeview/home_food_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var s = Sizer();
    Get.put(HomeController());
    return MaterialApp(
      home: DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Product Management"),
            leading: IconButton(
                onPressed: () {
                  controller.logoutConfirmation();
                },
                icon: Icon(Icons.logout)),
            actions: [
              PopupMenuButton(
                  icon: Icon(Icons.add),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(
                            "Food",
                            style: TextStyle(color: Colors.black),
                          ),
                          // value: 1,
                          onTap: () {
                            controller.modalBottomSheet(itemType: "Food");
                          },
                        ),
                        PopupMenuItem(
                          child: Text(
                            "Drinks",
                            style: TextStyle(color: Colors.black),
                          ),
                          // value: 2,
                          onTap: () {
                            controller.modalBottomSheet(itemType: "Drinks");
                          },
                        ),
                      ]),
              // SizedBox(
              //   width: s.width(context: context, width: 2),
              // )
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.food_bank),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Food")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_drink),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Drinks")
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [HomeFoodView(), HomeDrinksView()],
          ),
        ),
        length: 2,
      ),
    );
  }
}
