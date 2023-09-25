import 'package:ecommerce_app/bloc/get_products/get_products_bloc.dart';
import 'package:ecommerce_app/data/datasources/product_remote_datasource.dart';
import 'package:ecommerce_app/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => GetProductsBloc(ProductRemoteDataSource()),
      child: MaterialApp(
        title: 'Flutter E-Commerce',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HomePage(),
      ),
    );
  }
}

// import 'package:ecommerce_app/counter_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() => runApp(CounterApp());

// class CounterApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (_) => CounterCubit(),
//         child: CounterPage(),
//       ),
//     );
//   }
// }


// class CounterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter')),
//       body: BlocBuilder<CounterCubit, int>(
//         builder: (context, count) => Center(child: Text('$count', style: const TextStyle(fontSize: 100),)),
//       ),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             child: const Icon(Icons.add),
//             onPressed: () => context.read<CounterCubit>().increment(),
//           ),
//           const SizedBox(height: 4),
//           FloatingActionButton(
//             child: const Icon(Icons.remove),
//             onPressed: () => context.read<CounterCubit>().decrement(),
//           ),
//         ],
//       ),
//     );
//   }
// }