import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/controllers/dashboard_provider.dart';
import 'package:restaurant/views/widgets/order_history_card.dart';
import 'package:restaurant/views/widgets/search_text_field.dart';
import 'package:sizer/sizer.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.all(2.w),
            child: Image.asset('assets/images/logo.png'),
          ),
          title: Text(
            "Order History",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(6.w),
          child: Column(
            children: [
              SearchTextField(controller: dashboardProvider.searchController),
              SizedBox(height: 4.h),
              OrderHistoryCard(
                imagePath: "assets/images/mcdonalds_logo.png",
                restaurantName: "McDonald's",
                orderTime: "21:30",
                price: 45.50,
                orderStatus: "Process",
                orderStatusColor: Colors.green,
              ),
              SizedBox(height: 3.h),
              OrderHistoryCard(
                imagePath: "assets/images/wendys_logo.png",
                restaurantName: "Wendy's",
                orderTime: "11:00",
                price: 8.98,
                orderStatus: "Completed",
                orderStatusColor: Colors.blue,
              ),
              SizedBox(height: 3.h),
              OrderHistoryCard(
                imagePath: "assets/images/popeyes_logo.png",
                restaurantName: "Popeyes",
                orderTime: "23:45",
                price: 10,
                orderStatus: "Canceled",
                orderStatusColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
