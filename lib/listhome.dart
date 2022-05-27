import 'package:flutter/material.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const ContactCard();
        });
  }
}

class ContactCard extends StatefulWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_circle_rounded,
                size: 36,
                color: Colors.blue,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "  ibobi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("name"),
                ],
              ),
            ],
          ),
          const Icon(Icons.call)
        ],
      ),
    );
  }
}
