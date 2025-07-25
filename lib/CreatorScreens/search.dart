import 'package:buddy/res/contants/colors_contants.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ColorsContants.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: const [
                    SearchTile(
                        username: "ellucpaintings",
                        followers: "94.4K",
                        action: "Follow"),
                    SearchTile(
                        username: "tamanna_dhamra_789",
                        followers: "171",
                        action: "Follow"),
                    SearchTile(
                        username: "pri____36",
                        followers: "239",
                        action: "Follow"),
                    SearchTile(
                        username: "rupali.singhmishra",
                        followers: "44",
                        action: "Follow back"),
                    SearchTile(
                        username: "swarnimvj",
                        followers: "42.9K",
                        action: "Follow"),
                    SearchTile(
                        username: "anti.nationempower",
                        followers: "23.7K",
                        action: "Follow",
                        verified: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String username;
  final String followers;
  final String action;
  final bool verified;

  const SearchTile({
    Key? key,
    required this.username,
    required this.followers,
    required this.action,
    this.verified = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.grey,
        ),
        title: Row(
          children: [
            Text(
              username,
              style: TextStyle(color: ColorsContants.textColor),
            ),
            if (verified)
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Icon(Icons.verified, color: Colors.blue, size: 16),
              ),
          ],
        ),
        subtitle: Text(
          "$followers followers",
          style: TextStyle(color: ColorsContants.textColor),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero, // remove default padding
              minimumSize: const Size(0, 0), // remove default min constraints
              tapTargetSize:
                  MaterialTapTargetSize.shrinkWrap, // shrink tap area
              foregroundColor: Colors.grey,
            ),
            child: Text(
              action,
              style: const TextStyle(
                  fontSize: 12, color: Color(0xFF213555)), // smaller text
            ),
          ),
        ));
  }
}
