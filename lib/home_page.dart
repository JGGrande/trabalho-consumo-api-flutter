import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trabalho_api/details_page.dart';
import 'package:trabalho_api/models/personagem.dart';
import 'package:trabalho_api/remote/personagem_remote.dart';
import 'package:trabalho_api/widgets/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personagens"), backgroundColor: Colors.blue, centerTitle: true,),
      body:  FutureBuilder(
        future: PersonagemRemote().get(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Loading();
            default:
              return _criarLista(context, snapshot.data ?? []);
          }
        },
      )
    );
  }

  Widget _criarLista(BuildContext context, List<Personagem> personagens){
    return ListView.builder(
      itemCount: personagens.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(child: DetailsPage(personagens[index]), type: PageTransitionType.rightToLeft)
                );
              },
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        personagens[index].name,
                        style: const TextStyle(fontSize: 22),
                      ),
                      const Icon(Icons.arrow_right_alt)
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
