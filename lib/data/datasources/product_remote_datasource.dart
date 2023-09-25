import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/global_variables.dart';
import 'package:ecommerce_app/data/models/responses/list_product_model_response.dart';
import 'package:http/http.dart' as http;


class ProductRemoteDataSource{
  Future<Either<String,ListProductResponseModel>> getAllProducts() async {
    final response = await http.get(Uri.parse('${GlobalVariables.baseUrl}api/products'));

    if(response.statusCode == 200){
      return Right(ListProductResponseModel.fromRawJson(response.body));
    }else{
      return const Left('proses gagal');
    }
  }
}