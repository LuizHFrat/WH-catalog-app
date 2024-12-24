import 'package:catalogs_app/models/armie.dart';
import 'package:catalogs_app/screens/armie_details.dart';
import 'package:catalogs_app/widgets/armie_item.dart';
import 'package:flutter/material.dart';

class ArmiesScreen extends StatelessWidget {
  const ArmiesScreen({
    super.key,
    this.title,
    required this.armie,
  });

  final String? title;
  final List<Armie> armie;

  void selectArmie(BuildContext context, Armie armie) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ArmieDetaisScreen(
          armie: armie,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
          ),
        ],
      ),
    );

    if (armie.isNotEmpty) {
      content = ListView.builder(
        itemCount: armie.length,
        itemBuilder: (ctx, index) => ArmieItem(
          armie: armie[index],
          onSelectArmie: (armie) {
            selectArmie(context, armie);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
