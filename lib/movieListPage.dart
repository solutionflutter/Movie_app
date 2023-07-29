import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movieapp/controller/getDataFormApi.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  int select = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetDataFormApi().getDataGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/menu-01.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        title: Text(
          "MovieOnline",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width / 10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Avatar.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: MediaQuery.of(context).size.height / 25,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: GetDataFormApi.genres.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.height / 25,
                          width: MediaQuery.of(context).size.width / 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.black54,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "${GetDataFormApi.genres[index]}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
