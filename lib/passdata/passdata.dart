import 'dart:developer';

import 'package:flutter/material.dart';

class Passdata extends StatefulWidget {
  const Passdata({super.key});

  @override
  State<Passdata> createState() => _PassdataState();
}

class _PassdataState extends State<Passdata> {
  List<Quote> quotes = [
    Quote(
        author: "Oscar Wilde",
        quote: "Be Yourseld, everyone else is already taken"),
    Quote(
        author: "Oscar Wilde",
        quote: "I have nothing to declare except my genius "),
    Quote(
        author: "Oscar Wilde",
        quote: "The truth is rarely pure and never simple "),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
      ),
      body: Column(
        children: quotes
            .map((quote) => Quotecard(
                quote: quote,
                delete: () {
                  log("message");
                  setState(() {
                    log("setstatae");
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}

class Quote {
  String? author;
  String? quote;
  Quote({required this.author, required this.quote});
}

class Quotecard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  const Quotecard({super.key, required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(quote.quote.toString() ?? ""),
              const SizedBox(
                height: 10,
              ),
              Text(quote.author.toString()),
              const SizedBox(
                height: 10,
              ),
              TextButton.icon(
                onPressed: () {
                  log("delete methoid called");
                  delete();
                },
                label: Text("DeleteQuote"),
                icon: Icon(Icons.delete_outline),
              )
            ],
          ),
        ),
      ),
    );
  }
}
