import 'package:flutter/material.dart';
import 'package:recipes2/views/widgets/image_carrousel.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({Key? key}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  bool _isFavorited = true;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      if (_isFavorited) {
        modal(context, "Eliminado de favoritos");
      } else {
        modal(context, "Agregado a favoritos");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String imagen = arguments['thumbnailUrl'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            arguments['title'],
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor:
              Colors.transparent, //Color.fromARGB(255, 245, 231, 30),
          leading: Row(
            children: <Widget>[
              const SizedBox(
                width: 5.0,
              ),
              IconButton(
                color: Colors.white,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 245, 230, 30),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //CarouselWithIndicatorDemo(imagen: imagen),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(
                    image: NetworkImage(imagen),
                    fit: BoxFit.cover,
                    height: 280,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      )),
                  height: 540,
                  width: 500,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            arguments['title'],
                            style: const TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Tiempo de preparación: ${arguments['cookTime']}',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Divider(
                            color: Colors.black,
                            height: 10,
                          ),
                          //CounterDesign(),
                          const SizedBox(
                            height: 30.0,
                          ),
                          const Text(
                            'Descripción de la receta',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            arguments['title'],
                            style:
                                TextStyle(letterSpacing: 2.0, fontSize: 15.0),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ButtonTheme(
                                highlightColor: Colors.yellow,
                                buttonColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 250, 219, 128)),
                                ),
                                height: 20.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.yellow, elevation: 8),
                                  child: IconButton(
                                    iconSize: 35,
                                    icon: _isFavorited
                                        ? const Icon(
                                            Icons.favorite_border,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                    onPressed: _toggleFavorite,
                                  ),
                                  onPressed: _toggleFavorite,
                                ),
                              ),
                              const SizedBox(
                                width: 0.0,
                              ),
                              /* ButtonTheme(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                height: 70.0,
                                minWidth: 260.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    modal(context, "fdg");
                                  },
                                  child: const Text(
                                    'Add to cart',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ) */
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void modal(BuildContext context, String mensaje) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView(shrinkWrap: true, children: <Widget>[
                Center(
                    child: Text(
                  '${mensaje}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
              ]));
        });
  }
}
