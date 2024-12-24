import 'package:catalogs_app/models/armie.dart';
import 'package:catalogs_app/widgets/armie_item_trait.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ArmieItem extends StatelessWidget {
  const ArmieItem({
    super.key,
    required this.armie,
    required this.onSelectArmie,
  });

  final Armie armie;
  final void Function(Armie armie) onSelectArmie;

  String get complexityText {
    return armie.complexity.name[0].toUpperCase() +
        armie.complexity.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip
          .hardEdge, //remove content that would go outside of the shape boundaries
      elevation: 3,
      child: InkWell(
        onTap: () {
          onSelectArmie(armie);
        },
        child: Stack(
          children: [
            Hero(
              tag: armie.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(armie.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      armie.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow
                          .ellipsis, //very long text, cut off with ...
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ArmieItemTrait(
                          icon: Icons.electric_bolt_outlined,
                          label: 'Detachment power: ${armie.power} out of 10',
                        ),
                        const SizedBox(width: 35),
                        ArmieItemTrait(
                            icon: Icons.dangerous, label: complexityText),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ), //used to position multiple widgets above each other.
      ),
    ); //Inkwell = tapable
  }
}
