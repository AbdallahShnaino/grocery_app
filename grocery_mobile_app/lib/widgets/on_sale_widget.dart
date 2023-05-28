import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/heart_btn.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../consts/firebase_consts.dart';
import '../inner_screens/on_sale_screen.dart';
import '../inner_screens/product_details.dart';
import '../models/products_model.dart';
import '../providers/cart_provider.dart';
import '../providers/wishlist_provider.dart';
import '../services/global_methods.dart';
import 'price_widget.dart';

class OnSaleWidget extends StatefulWidget {
  bool isInProductsGridView = false;
  OnSaleWidget({Key? key, this.isInProductsGridView = false}) : super(key: key);

  @override
  State<OnSaleWidget> createState() =>
      _OnSaleWidgetState(isInProductsGridView: isInProductsGridView);
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  bool isInProductsGridView = false;
  _OnSaleWidgetState({required this.isInProductsGridView});
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final productModel = Provider.of<ProductModel>(context);
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    final cartProvider = Provider.of<CartProvider>(context);
    bool? _isInCart = cartProvider.getCartItems.containsKey(productModel.id);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    bool? _isInWishlist =
        wishlistProvider.getWishlistItems.containsKey(productModel.id);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: productModel.id);
            // GlobalMethods.navigateTo(
            //     ctx: context, routeName: ProductDetails.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FancyShimmerImage(
                        imageUrl: productModel.imageUrl,
                        height: isInProductsGridView == true ? 75.h : 80.h,
                        width: isInProductsGridView == true ? 75.w : 80.w,
                        boxFit: BoxFit.fill,
                      ),
                      isInProductsGridView == true
                          ? SizedBox(
                              width: 10.w,
                            )
                          : SizedBox(
                              width: 0,
                            ),
                      Column(
                        children: [
                          TextWidget(
                            text: productModel.isPiece ? '1Piece' : '1KG',
                            color: color,
                            textSize: 16.sp,
                            isTitle: true,
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: _isInCart
                                    ? null
                                    : () async {
                                        final User? user =
                                            authInstance.currentUser;

                                        if (user == null) {
                                          GlobalMethods.errorDialog(
                                              subtitle:
                                                  'No user found, Please login first',
                                              context: context);
                                          return;
                                        }
                                        await GlobalMethods.addToCart(
                                            productId: productModel.id,
                                            quantity: 1,
                                            context: context);
                                        await cartProvider.fetchCart();
                                        // cartProvider.addProductsToCart(
                                        //     productId: productModel.id,
                                        //     quantity: 1);
                                      },
                                child: Icon(
                                  _isInCart
                                      ? IconlyBold.bag2
                                      : IconlyLight.bag2,
                                  size: 22,
                                  color: _isInCart ? Colors.green : color,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              HeartBTN(
                                productId: productModel.id,
                                isInWishlist: _isInWishlist,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  PriceWidget(
                    salePrice: productModel.salePrice,
                    price: productModel.price,
                    textPrice: '1',
                    isOnSale: true,
                  ),
                  const SizedBox(height: 5),
                  TextWidget(
                    text: productModel.title,
                    color: color,
                    textSize: 12.sp,
                    isTitle: true,
                  ),
                  // const SizedBox(height: 5),
                ]),
          ),
        ),
      ),
    );
  }
}
