import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
    required this.item,
    required this.deleteTask,
  });
  final item;
  final Function deleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xffdfdfdf),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xff4B4B4B),
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  deleteTask(item.id);
                }
                return print('pressedCancel');
              },
              child: const Icon(
                Icons.delete_outline,
                color: Color(0xff4B4B4B),
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
