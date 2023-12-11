import 'package:flutter/material.dart';

class Movie_Data_Play {
  final String title;
  final String genre;
  final String country;
  final String story;
  final String picture;

  Movie_Data_Play({
    required this.title,
    required this.genre,
    required this.country,
    required this.story,
    required this.picture,
  });
}

class Movie_Data_Play_Provider extends ChangeNotifier {
  List<Movie_Data_Play> _movieListPlay = [
    Movie_Data_Play(
        title: 'The NUN II',
        genre: 'Horror',
        country: 'USA',
        story:
            'Set in 1956, starting with the murder of a priest, Sister Irene (Taissa Farmiga) once again faces a huge evil force, Valak the demon nun for the sake of the peace of her life and the people around her.',
        picture: 'poster.png'),
    Movie_Data_Play(
        title: 'Avengers',
        genre: 'Action',
        country: 'USA',
        story:
            'The Asgardian Loki encounters the Other, the leader of an extraterrestrial race known as the Chitauri. In exchange for retrieving the Tesseract, a powerful energy source of unknown potential, the Other promises Loki an army with which he can subjugate Earth. Nick Fury, director of the espionage agency S.H.I.E.L.D., arrives at a remote research facility, where physicist Dr. Erik Selvig is leading a team experimenting on the Tesseract. The Tesseract suddenly activates and opens a wormhole, allowing Loki to reach Earth. Loki steals the Tesseract and uses his scepter to enslave Selvig and other agents, including Clint Barton, to aid him.',
        picture: 'poster2.jpg'),
    Movie_Data_Play(
        title: 'Maleficent',
        genre: 'Fantasy',
        country: 'USA',
        story:
            'A beautiful, pure-hearted young woman, Maleficent has an idyllic life growing up in a peaceable forest kingdom, until the day an invading army threatens the harmony of the land. Maleficent rises to be the lands fiercest protector, but she ultimately suffers a ruthless betrayal--an act that turns her pure heart to stone. Bent on revenge, Maleficent faces a battle with the invading kings successor; as a result she places a curse upon his newborn daughter Aurora. As the child grows, Maleficent realizes that Aurora holds the key to peace in the kingdom--and perhaps to Maleficents true happiness as well.',
        picture: 'poster8.jpg'),
  ];

  List<Movie_Data_Play> get movieListPlay => _movieListPlay;
}
