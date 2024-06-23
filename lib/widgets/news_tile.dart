import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String newsHeadline;
  final Function()? function;
  final String source;

  const NewsTile({
    Key? key,
    required this.newsHeadline,
    this.function,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey[300]!), 
        borderRadius: BorderRadius.circular(8), 
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: function,
        title: Text(
          newsHeadline,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          source,
          style: const TextStyle(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
