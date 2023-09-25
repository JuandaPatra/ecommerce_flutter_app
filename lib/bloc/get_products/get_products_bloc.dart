import 'package:ecommerce_app/bloc/get_products/get_products_event.dart';
import 'package:ecommerce_app/bloc/get_products/get_products_state.dart';
import 'package:ecommerce_app/data/datasources/product_remote_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final ProductRemoteDataSource productRemoteDataSource;

  GetProductsBloc(this.productRemoteDataSource) : super(GetProductsInitial()) {
    on(
      (event, emit) async {
        emit(GetProductsLoading());
        final result = await productRemoteDataSource.getAllProducts();
        result.fold((l) => emit(GetProductsError()),
            (r) => emit(GetProductsLoaded(listProductResponseModel: r)));
      },
    );
  }
}
