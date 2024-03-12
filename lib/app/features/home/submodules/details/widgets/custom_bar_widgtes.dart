import 'package:flutter/material.dart';

import '../../../../../core/widgets/constants_widget.dart';

import 'package:share_plus/share_plus.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: appPadding,
        right: appPadding,
        top: appPadding,
      ),
      child: SizedBox(
        height: size.height * 0.10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //  lógica favoritar
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.favorite_rounded,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Share.share(
                  'Olhem esse imóvel, que legal! https://imoblist.com.br/',
                );
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.share_rounded,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
