import 'package:all_widget2/collasable_drawer/screens/home/home_screen.dart';
import 'package:all_widget2/pdf/main_pdf.dart';
import 'package:all_widget2/share_widget.dart';
import 'package:all_widget2/side_menu_animation/side_menu_animation.dart';
import 'package:all_widget2/widget/AllWidget.dart';
import 'package:all_widget2/widget/Appbars.dart';
import 'package:all_widget2/widget/Spinkit.dart';
import 'package:all_widget2/widget/CupertinoContextMenuPage.dart';
import 'package:all_widget2/widget/ReorderableListView.dart';
import 'package:all_widget2/widget/Stepper.dart';
import 'package:all_widget2/widget/Transform.dart';
import 'package:all_widget2/widget/analog_clock.dart';
import 'package:all_widget2/widget/animation_getx.dart';
import 'package:all_widget2/widget/badges.dart';
import 'package:all_widget2/widget/dragtarget.dart';
import 'package:all_widget2/widget/easy_stepper.dart';
import 'package:all_widget2/widget/hero_animations.dart';
import 'package:all_widget2/widget/long_press_draggable.dart';
import 'package:all_widget2/widget/all_button.dart';
import 'package:all_widget2/widget/slider_side_menu.dart';
import 'package:all_widget2/widget/syncfusionfluttersliders.dart';
import 'package:all_widget2/widget/table.dart';
import 'package:all_widget2/widget/table2.dart';
import 'package:all_widget2/widget/voice_message.dart';
import 'package:all_widget2/widget2/add_to_cart_animation.dart';
import 'package:all_widget2/widget2/animation_list.dart';
import 'package:all_widget2/widget2/custom_rating_bar.dart';
import 'package:all_widget2/widget2/dots_indicator.dart';
import 'package:all_widget2/widget2/flutter_rating_bar.dart';
import 'package:all_widget2/widget2/flutter_reorderable_grid_view.dart';
import 'package:all_widget2/widget2/liquid_pull_to_refresh.dart';
import 'package:all_widget2/widget2/loadmore_listview.dart';
import 'package:all_widget2/widget2/rating_dialog.dart';
import 'package:all_widget2/widget2/rating_summary.dart';
import 'package:all_widget2/widget2/searchbar_animation .dart';
import 'package:all_widget2/widget2/auto_animated.dart';
import 'package:all_widget2/widget2/carousel_indicator.dart';
import 'package:all_widget2/widget2/circular_reveal_animation.dart';
import 'package:all_widget2/widget2/clickable_list_wheel_view.dart';
import 'package:all_widget2/widget2/flutter_animated_icons.dart';
import 'package:all_widget2/staggered_animations/flutter_staggered_animations.dart';
import 'package:all_widget2/widget2/jtdetector.dart';
import 'package:all_widget2/widget2/loading_animation_widget.dart';
import 'package:all_widget2/widget2/searchable_listview.dart';
import 'package:all_widget2/widget2/shaky_animated_listview.dart';
import 'package:all_widget2/widget2/shimmer.dart';
import 'package:all_widget2/widget2/smooth_sort.dart';
import 'package:all_widget2/widget2/smooth_star_rating_null_safety.dart';
import 'package:all_widget2/widget2/ticket_material.dart';
import 'package:all_widget2/widget2/transformable_list_view.dart';
import 'package:all_widget2/widget3/bottom_bar_with_sheet.dart';
import 'package:all_widget2/widget3/icons_plus.dart';
import 'package:all_widget2/widget3/photo_card_swiper.dart';
import 'package:all_widget2/widget3/proste_bezier_curve.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/Customerror.dart';
import 'widget/syncfusion_flutter_gauges.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Widget"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "All Widget ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("AllWidget", AllWidget()),
                buildMaterialButton(
                    "Long Press Draggable", LongPressDraggablePage()),
                buildMaterialButton(
                    "Reorderable List View ", ReorderableListViewPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton(
                    "CupertinoContextMenu", CupertinoContextMenuPage()),
                buildMaterialButton("table", TablePage()),
                buildMaterialButton("Stepper", StepperPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("table", Table2()),
                buildMaterialButton("Transform", TransformPage()),
                buildMaterialButton("spinkit", SpinkitPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("DragTarget", DragTargetPage()),
                buildMaterialButton("Custom error widget", CustomError()),
                buildMaterialButton("Get x Animation", GetXAnimation()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("HeroAnimations", HeroAnimations()),
                buildMaterialButton("PDF", MainPDF()),
                buildMaterialButton("Easy Stepper ", EasyStepperPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("Analog Clock ", AnalogClockPage()),
                buildMaterialButton("Syncfusion ", SyncfusionPage()),
                buildMaterialButton("Badges  ", BadgesPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("voice message", ChatPage()),
                buildMaterialButton("ShapeAppBar", ShapeAppBar()),
                buildMaterialButton("SliderSideMenu", SliderSideMenuPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("CollasableDrawer", CollasableDrawer()),
                buildMaterialButton(
                    "side menu animation", sideMenuAnimationPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("JTextDetector ", JTextDetectorExample()),
                buildMaterialButton("TicketMaterial ", TicketPage()),
                buildMaterialButton("TicketMaterial ", MyTicketView()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton(
                    "carousel indicator", carouselindicatorPage()),
                buildMaterialButton("Animated Icons ", AnimatedIconsPage()),
                buildMaterialButton("shimmerpage ", shimmerpage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("circular reveal", circular_reveal()),
                buildMaterialButton("add to cart animation", AddToCart()),
                buildMaterialButton(
                    "staggered_animations ", staggered_animations()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("List wheel", Listwheel()),
                buildMaterialButton("shaky animated", shaky_animated()),
                buildMaterialButton("AnimationListDemo ", AnimationListDemo()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("AnimatedList", AnimatedListPage()),
                buildMaterialButton("Transformable List View", ExampleScreen()),
                buildMaterialButton("loadingwidget ", loadingwidgetPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton(
                    "Searchbar Animation", SearchbarAnimationExample()),
                buildMaterialButton("Searchable", Searchable()),
                buildMaterialButton("DotsDecoratorPage ", DotsDecoratorPage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("LiquidPull", LiquidPull()),
                buildMaterialButton("rating_bar", rating_bar()),
                buildMaterialButton("rating_dialog  ", rating_dialogpage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("Custom_Rating", Custom_Rating()),
                buildMaterialButton(
                    "rating_summary_page", rating_summary_page()),
                buildMaterialButton("smooth_star  ", smooth_star()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("loadmore", loadmore()),
                buildMaterialButton("reorderable_grid_view", gridViewpage()),
                buildMaterialButton("bottom bar with sheet ", BaseExample()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMaterialButton("icons_plus", icons_plus_page()),
                buildMaterialButton("photo_card_swiper", ExamplePageWidget()),
                buildMaterialButton("proste_bezier_curve", curvepage()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
