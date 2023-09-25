import 'package:ecommerce_app/bloc/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/bloc/checkout/checkout_event.dart';
import 'package:ecommerce_app/bloc/get_products/get_products_bloc.dart';
import 'package:ecommerce_app/bloc/get_products/get_products_event.dart';
import 'package:ecommerce_app/bloc/get_products/get_products_state.dart';
import 'package:ecommerce_app/data/models/responses/list_product_model_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProductWidget extends StatefulWidget {
  const ListProductWidget({super.key});

  @override
  State<ListProductWidget> createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  @override
  void initState() {
    context.read<GetProductsBloc>().add(DoGetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsError) {
          return const Center(
            child: Text('data error'),
          );
        }

        if (state is GetProductsLoaded) {
          if (state.listProductResponseModel.data!.isEmpty) {
            return const Center(
              child: Text('Data Empty'),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final Product product =
                  state.listProductResponseModel.data![index];
              return Card(
                elevation: 2,
                shadowColor: const Color(0xffEE4D2D),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 120,
                      child: Image.network('${product.attributes!.image!}'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Rp.${product.attributes!.price!}',
                      style: const TextStyle(
                        color: Color(0xffEE4D2D),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${product.attributes!.title!}",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.add_shopping_cart,
                                    size: 20,
                                    color: Color(0xffEE4D2D),
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Text(
                                  "Beli",
                                  style: TextStyle(
                                    color: Color(0xffEE4D2D),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.read<CheckoutBloc>().add(
                                        RemoveFromCartEvent(product: product));
                                  },
                                  child: const Icon(
                                    Icons.remove_circle_outline,
                                    size: 18,
                                    color: Color(0xffEE4D2D),
                                  ),
                                ),
                                const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('1')),
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<CheckoutBloc>()
                                        .add(AddToCartEvent(product: product));
                                  },
                                  child: const Icon(
                                    Icons.add_circle_outline,
                                    size: 18,
                                    color: Color(0xffEE4D2D),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: state.listProductResponseModel.data!.length,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
