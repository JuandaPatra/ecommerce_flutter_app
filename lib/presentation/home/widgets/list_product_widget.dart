import 'package:flutter/material.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8,childAspectRatio: 0.65,),
        itemBuilder: (context, index) {
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
                    child: Image.network('https://images.tokopedia.net/img/cache/100-square/VqbcmM/2022/8/2/0c94efd3-50d2-4658-933b-8b91e13e267d.jpg.webp?ect=4g'),
                  ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Rp.1.500.000',
                  style:  TextStyle(
                    color:  Color(0xffEE4D2D),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
               const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Sepatu Bola",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: 20,
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
                              onTap: () {},
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
                              onTap: () {},
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
        itemCount: 20,
      ),
    );
  }
}
