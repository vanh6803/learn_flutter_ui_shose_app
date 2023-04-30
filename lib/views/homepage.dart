import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learn_ui_fluter_1/fake_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _shoeBrand = ['Nike', 'Adidas', 'Converence', 'Vans'];

  @override
  Widget build(BuildContext context) {
    //thay đổi image ở đây
    final imageProvider = const DecorationImage(
      image: NetworkImage(
        'https://khoinguonsangtao.vn/wp-content/uploads/2022/09/hinh-anh-che-mat.jpg',
      ),
      fit: BoxFit.cover,
    ).image;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        leading: const Icon(Icons.menu, color: Color(0xff6e61fa)),
        actions: [
          const Icon(
            Icons.nightlight_outlined,
            color: Color(0xff6e61fa),
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: CircleAvatar(
              backgroundImage: imageProvider,
              radius: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Brand',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 20, left: 10),
                // child: TextField(
                //   decoration: InputDecoration(
                //       prefixIcon: Icon(Icons.search),
                //       hintText: 'search',
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(100.0),
                //         borderSide:
                //             BorderSide(color: Color(0xff757575), width: 2.0),
                //       )),
                // ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xffEDEDED),
                    border: Border.all(
                      color: const Color(0xffEDEDED),
                      width: 1,
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      hintText: 'search',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                child: Row(
                  children:
                      List<Widget>.generate(_shoeBrand.length, (int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: ChoiceChip(
                          elevation: _selectedIndex == index ? 4 : 0,
                          selectedShadowColor: Colors.grey,
                          selectedColor: const Color(0xff6e61fa),
                          backgroundColor: Colors.white12,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          label: Text(
                            _shoeBrand[index],
                            style: TextStyle(
                                color: _selectedIndex == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          selected: _selectedIndex == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedIndex = selected ? index : 0;
                            });
                          }),
                    );
                  }).toList(),
                ),
              ),
              // listview
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: FAKE_SHOSE.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          padding: const EdgeInsets.only(left: 8),
                          width: 200,
                          height: 300,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Color(0xfff59292), Color(0xff6e61fa)]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(
                                      Icons.favorite_border,
                                      size: 27,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    FAKE_SHOSE[index].urlImage,
                                    width: 180,
                                    height: 135,
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  FAKE_SHOSE[index].name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  '\$ ${FAKE_SHOSE[index].price}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Most Popular',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              SizedBox(
                height: 580,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: FAKE_SHOSE.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 15, right: 20, left: 10),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Color(0xff6e61fa),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //image
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xff6e61fa),
                                      borderRadius: BorderRadius.circular(60),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                        FAKE_SHOSE[index].urlImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ))),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FAKE_SHOSE[index].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                Text(
                                  '\$ ${FAKE_SHOSE[index].price}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                              ],
                            )),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
