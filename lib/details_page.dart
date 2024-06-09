import 'package:flutter/material.dart';
import 'package:trabalho_api/models/personagem.dart';

class DetailsPage extends StatefulWidget {
  final Personagem personagem;
  const DetailsPage(this.personagem,{super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.personagem.name, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(widget.personagem.image, fit: BoxFit.cover),
            Center(
              child: Column(
                children: [
                  Text(widget.personagem.status, style: const TextStyle(fontSize: 30), ),
                  Text(widget.personagem.species, style: const TextStyle(fontSize: 30), ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
