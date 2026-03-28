import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/gen/assets.gen.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.lottie.emptyNotes.lottie(
          width: context.wd(200),
          height: context.hg(200),
          animate: true,
          fit: BoxFit.contain,
        ),
        Text(
          textAlign: TextAlign.center,
          "Start Your Journey",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: context.hg(16)),
        Text(
          textAlign: TextAlign.center,
          "Every big step start with small step.\nNotes your first idea and start\nyour journey!",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: context.hg(20)),
        Assets.images.arrow.image(),
        SizedBox(height: context.hg(24)),
      ],
    );
  }
}
