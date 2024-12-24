import 'package:catalogs_app/models/armie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catalogs_app/providers/favorites_provider.dart';

class ArmieDetaisScreen extends ConsumerWidget {
  const ArmieDetaisScreen({
    super.key,
    required this.armie,
  });

  final Armie armie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteArmie = ref.watch(favoriteArmiesProvider);

    final isFavorite = favoriteArmie.contains(armie);

    return Scaffold(
      appBar: AppBar(
        title: Text(armie.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteArmiesProvider.notifier)
                  .toggleArmieFavoriteStatus(armie);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text(wasAdded ? 'Army adicionado!' : 'Army removido!'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (buttom, turning) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.5, end: 0.8).animate(turning),
                  child: buttom,
                );
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: armie.id,
              child: Image.network(
                armie.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Detachment Details',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            for (final history in armie.history)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                child: Text(
                  history,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            const SizedBox(height: 25),
            Text(
              'Army List',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            for (final armielist in armie.armielist)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                child: Text(
                  armielist,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
