import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/inner_screens/product_details.dart';
import 'package:grocery_app/models/wishlist_model.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/widgets/heart_btn.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/products_provider.dart';
import '../../providers/wishlist_provider.dart';
import '../../services/utils.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    final wishlistModel = Provider.of<WishlistModel>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final getCurrProduct =
        productProvider.findProdById(wishlistModel.productId);
    double usedPrice = getCurrProduct.isOnSale
        ? getCurrProduct.salePrice
        : getCurrProduct.price;
    bool? _isInWishlist =
        wishlistProvider.getWishlistItems.containsKey(getCurrProduct.id);
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routeName,
              arguments: wishlistModel.productId);
        },
        child: Container(
          height: 200.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                // width: size.width * 0.2,
                height: 100.h,
                width: 100.w,
                child: FancyShimmerImage(
                  imageUrl: getCurrProduct.imageUrl,
                  boxFit: BoxFit.fill,
                ),
              ),
              Container(
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconlyLight.bag2,
                            color: color,
                          ),
                        ),
                        HeartBTN(
                          productId: getCurrProduct.id,
                          isInWishlist: _isInWishlist,
                        )
                      ],
                    ),
                    Column(children: [
                      TextWidget(
                        text: getCurrProduct.title,
                        color: color,
                        textSize: 10.sp,
                        maxLines: 2,
                        isTitle: true,
                      ),
                      TextWidget(
                        text: '\$${usedPrice.toStringAsFixed(2)}',
                        color: color,
                        textSize: 10.sp,
                        maxLines: 1,
                        isTitle: true,
                      )
                    ]),
                  ],
                ),

                /* 
                
                  TextWidget(
                text: getCurrProduct.title,
                color: color,
                textSize: 12.sp,
                maxLines: 2,
                isTitle: true,
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: '\$${usedPrice.toStringAsFixed(2)}',
                color: color,
                textSize: 11.sp,
                maxLines: 1,
                isTitle: true,
              )

                
                */
              ),
            ],
          ),
        ),
      ),
    );
  }
}
