import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/productsmodel.dart';
import 'package:ecommerce/view/widget/home/customappbar.dart';
import 'package:ecommerce/view/widget/home/customcardhome.dart';
import 'package:ecommerce/view/widget/home/customtitlehome.dart';
import 'package:ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:ecommerce/view/widget/home/listproductshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppBar(
                  mycontroller: controller.search!,
                  titleappbar: "Find Product",
                  onPressedIcon: () {},
                  onPressedSearch: () {
                    controller.onSearchProducts();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  onPressedIconFavorite: () {
                    Get.toNamed(AppRoute.myfavroite);
                  },
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.isSearch
                        ? ListProductsSearch(listdatamodel: controller.listdata)
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCardHome(
                                  title: controller.titleHomeCard,
                                  body: controller.bodyHomeCard),
                              const CustomTitleHome(title: "Categories"),
                              const ListCategoriesHome(),
                              const CustomTitleHome(title: "Top Selling"),
                              const ListProductsHome(),
                            ],
                          )
                    // const CustomTitleHome(title: "Offer"),
                    // const ListProductsHome(),
                    )
              ],
            )));
  }
}

class ListProductsSearch extends GetView<HomeControllerImp> {
  final List<ProductsModel> listdatamodel;
  const ListProductsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listdatamodel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => controller.goToPageProductDetails(listdatamodel[index]),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: "${listdatamodel[index].image}",
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(listdatamodel[index].productName!),
                            subtitle: Text(listdatamodel[index].productDesc!),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

