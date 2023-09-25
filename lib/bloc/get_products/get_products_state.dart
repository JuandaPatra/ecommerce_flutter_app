import 'package:ecommerce_app/data/models/responses/list_product_model_response.dart';

abstract class GetProductsState{}
class GetProductsInitial extends GetProductsState{}

class GetProductsLoading extends GetProductsState{}

class GetProductsLoaded extends GetProductsState{
  ListProductResponseModel listProductResponseModel;

  GetProductsLoaded({
    required this.listProductResponseModel
  });
}

class GetProductsError extends GetProductsState{}