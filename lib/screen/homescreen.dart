import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:skyscrapper/provider/weather_provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Provider.of<WeatherProvider>(context).getData();
    return Consumer<WeatherProvider>(
        builder: (context, provider, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffa6b7fd),
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.bars),
                ),
                title: Text(provider.foreList.first.day!),
                centerTitle: true,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search))
                ],
              ),
              backgroundColor: Color(0xffa6b7fd),
              body: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 550,
                    decoration: BoxDecoration(
                      color: Color(0xffcdd1fc),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/2.json"),
                        Align(
                          alignment: Alignment(-0.8, 0.2),
                          child: Text(
                            "${provider.foreList.first.code}°",
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4b53df),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.8, -0.1),
                          child: Text(
                            "${provider.foreList.first.text}°",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4b53df),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Today",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: provider.foreList
                                .map(
                                  (e) => Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                    height: 100,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Text(
                                            "${e.day}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${e.code}°",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Lottie.asset("assets/3.json",
                                              width: 25)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
// !provider.isLoading
// ? const Center(
// child: CircularProgressIndicator(),
// )
//     : Padding(
// padding: const EdgeInsets.only(top: 30),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// (provider.isSearch)
// ? Row(
// children: [
// Padding(
// padding:
// const EdgeInsets.only(left: 20, right: 20),
// child: TextField(
// controller: searchController,
// onSubmitted: (val) {
// provider.city = val;
// },
// decoration: const InputDecoration(
// border: InputBorder.none,
// hintText: "Search Your Location..",
// ),
// ),
// ),
// IconButton(
// icon: Icon(CupertinoIcons.search),
// onPressed: () {
// provider.city = searchController.text;
// },
// )
// ],
// )
//     : Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// IconButton(
// onPressed: () {},
// icon: const Icon(CupertinoIcons.bars),
// ),
// Text(
// provider.foreList.first.day!,
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20,
// color: const Color(0xff2f2f85),
// ),
// ),
// IconButton(
// onPressed: () {
// provider.gotoSearch();
// },
// icon: const Icon(CupertinoIcons.add),
// ),
// ],
// ),
