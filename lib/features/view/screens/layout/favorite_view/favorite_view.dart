import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/gen/assets.gen.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.lottie.favoriteEdit.lottie(
              width: context.wd(200),
              height: context.hg(200),
              animate: true,
              fit: BoxFit.contain,
            ),
            Text(
              textAlign: TextAlign.center,
              "No Favorites Yet",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              textAlign: TextAlign.center,
              "Save the models you\n love and find them quickly anytime.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
