// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ContactListView extends StatelessWidget {
  final String name;
  final String phone;
  const ContactListView({
    Key? key,
    required this.name,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      return ContactCard(
        name: '',
        phone: '',
      );
    }
  }
}

// ignore: must_be_immutable
class ContactCard extends StatefulWidget {
  final String name;

  String phone;

  ContactCard({
    Key? key,
    required this.name,
    required this.phone,
  }) : super(key: key);

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
                  Text(
                    "Name : ${widget.name}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Phone : ${widget.phone}",
                  ),
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
