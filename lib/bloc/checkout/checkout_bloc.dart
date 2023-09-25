import 'package:ecommerce_app/bloc/checkout/checkout_event.dart';
import 'package:ecommerce_app/bloc/checkout/checkout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutBloc extends Bloc<CheckoutEvent,CheckoutState>{

  CheckoutBloc(): super(CheckoutLoaded(items: [])){
    on<AddToCartEvent>((event, emit){
       final currentState = state as CheckoutLoaded;
       
      emit(CheckoutLoading());
      emit(CheckoutLoaded(items:[...currentState.items,event.product]));
    });

    on<RemoveFromCartEvent>((event, emit) {
       final currentState = state as CheckoutLoaded;
       
       currentState.items.remove(event.product);
       emit(CheckoutLoading());
       emit(CheckoutLoaded(items: currentState.items));
    },);
  }
}