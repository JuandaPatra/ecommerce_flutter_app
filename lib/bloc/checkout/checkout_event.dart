import 'package:ecommerce_app/data/models/responses/list_product_model_response.dart';

abstract class CheckoutEvent{}


class AddToCartEvent extends CheckoutEvent{
  final Product product;
  AddToCartEvent({
    required this.product
  });
}


class RemoveFromCartEvent extends CheckoutEvent{
  final Product product;
  RemoveFromCartEvent({
    required this.product
  });
}