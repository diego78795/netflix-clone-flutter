import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone_flutter/app/controllers/home_controller.dart';
import 'package:netflix_clone_flutter/app/data/model/banner_model.dart';
import 'package:netflix_clone_flutter/app/data/model/movie_model.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x00211f1f),
        body: GetBuilder<HomeController>(builder: (_) {
          List<Widget> moives = _.movieList
              .map((category) => Column(children: [
                    const SizedBox(height: 12),
                    ContainerMovie(
                      title: category['title'],
                      movieList: category['items'],
                    )
                  ]))
              .toList();
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Color.fromRGBO(238, 21, 32, 1),
                ))
              : SafeArea(
                  child: ListView(
                  children: [
                    FeaturedMovieBanner(movieBanner: _.movieBanner),
                    ...moives
                  ],
                ));
        }));
  }
}

class ContainerMovie extends StatelessWidget {
  const ContainerMovie(
      {super.key, required this.title, required this.movieList});

  final String title;
  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          )),
      const SizedBox(height: 5),
      SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
            itemBuilder: (context, index) {
              return CardMovie(img: movieList[index].img);
            },
          ))
    ]);
  }
}

class CardMovie extends StatelessWidget {
  const CardMovie({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 140.0,
        height: 210.0,
        color: const Color.fromRGBO(50, 50, 50, 1),
        child: Image.network('https://image.tmdb.org/t/p/w300$img'));
  }
}

class FeaturedMovieBanner extends StatelessWidget {
  const FeaturedMovieBanner({super.key, required this.movieBanner});

  final BannerModel movieBanner;

  @override
  Widget build(BuildContext context) {
    String genres = '';
    for (var genre in movieBanner.genres) {
      genres = '$genres ● ${genre['name']}';
    }
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.black],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          child: Container(
              height: 600,
              child: Image.network(
                'https://image.tmdb.org/t/p/original${movieBanner.img}',
                fit: BoxFit.fitHeight,
              )),
        ),
        Positioned(
            bottom: 105.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      movieBanner.titulo,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900,
                          fontSize: 35),
                    )),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Série$genres',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ))),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                              elevation: 0),
                          onPressed: () => debugPrint("Clicou"),
                          child: const Column(
                            children: [
                              Icon(Icons.add, size: 30),
                              Text('Minha lista',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, elevation: 0),
                          onPressed: () => debugPrint("Clicou"),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                size: 30,
                                color: Colors.black,
                              ),
                              Text('Play',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                              elevation: 0),
                          onPressed: () => debugPrint("Clicou"),
                          child: const Column(
                            children: [
                              Icon(Icons.info_outline, size: 30),
                              Text(
                                'Info',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ))
      ],
    );
  }
}
