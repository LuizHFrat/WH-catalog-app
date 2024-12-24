import 'package:catalogs_app/models/armie.dart';
import 'package:flutter/material.dart';
import 'package:catalogs_app/models/category.dart';

final List<Category> availableCategories = [
  Category(
      id: 'c1',
      title: 'Space Marines',
      color: Color.fromARGB(255, 49, 19, 216),
      imageUrl:
          'https://warhammerart.com/wp-content/uploads/2024/01/Ultramarines-vs-Chaos-Space-Marines.jpg'),
  Category(
    id: 'c2',
    title: 'Heretic Astartes',
    color: Colors.red,
    imageUrl: 'He',
  ),
  Category(
    id: 'c3',
    title: 'Astra Militarum',
    color: Color.fromARGB(255, 3, 49, 28),
    imageUrl: 'He',
  ),
  Category(
    id: 'c4',
    title: 'Necrons',
    color: Color.fromARGB(255, 13, 252, 25),
    imageUrl: 'He',
  ),
  Category(
    id: 'c5',
    title: 'Aeldari',
    color: Colors.blue,
    imageUrl: 'He',
  ),
  Category(
    id: 'c6',
    title: 'Tyranids',
    color: Color.fromARGB(255, 145, 45, 45),
    imageUrl: 'He',
  ),
  Category(
    id: 'c7',
    title: 'Chaos Daemons',
    color: Color.fromARGB(255, 29, 34, 36),
    imageUrl: 'He',
  ),
  Category(
    id: 'c8',
    title: 'T\'au',
    color: Color.fromARGB(255, 250, 246, 4),
    imageUrl: 'He',
  ),
  Category(
    id: 'c9',
    title: 'Adepta Sororitas',
    color: Colors.pink,
    imageUrl: 'He',
  ),
  Category(
    id: 'c10',
    title: 'Orks',
    color: Color.fromARGB(195, 10, 187, 39),
    imageUrl: 'He',
  ),
];

const dummyArmie = [
  Armie(
    id: 'm1',
    categories: [
      'c1',
    ],
    title: 'Gladius Task Force',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://warhammerart.com/wp-content/uploads/2024/01/Ultramarines-vs-Chaos-Space-Marines.jpg',
    power: 8,
    history: [
      'The Gladius Task Force draws from the lore of the Ultramarines, promoting tactical flexibility and adherence to the doctrines of the Codex Astartes.',
      '\"Courage and honour!\"',
      '\"For the Primarch, for Ultramar, for the Emperor!\"',
    ],
    armielist: [
      'Marneus Calgar (185 points)',
      'Uriel Ventris (75 points)',
      'Lieutenant, Fire Discipline (95 points)',
      '10x Assault Intercessors (150 points)',
      '3x5 Assault Intercessors with Jump Packs (240 points)',
      'Company Heroes (95 points)',
      '5 Incursors (80 points)',
      '5 Infiltrators (100 points)',
    ],
    isChaos: false,
    isImperium: true,
    isXenos: false,
  )
];
