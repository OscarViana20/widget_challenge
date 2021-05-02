class SongModel {
  String imagePath;
  String imagePerson;
  String titleSong;
  String artistName;

  SongModel({
    this.imagePath,
    this.imagePerson,
    this.titleSong,
    this.artistName
  });
}

final playedList = [
  SongModel(
    imagePath: 'assets/images/img1.png',
    imagePerson: 'assets/images/person1.png',
    titleSong: 'Bloody Tear',
    artistName: 'Lxst Cxntury'
  ),
  SongModel(
    imagePath: 'assets/images/img2.png',
    imagePerson: 'assets/images/person2.png',
    titleSong: 'Leave Me Alone',
    artistName: 'SuicideBoyS'
  ),
  SongModel(
    imagePath: 'assets/images/img3.png',
    imagePerson: 'assets/images/person3.png',
    titleSong: 'Song 3',
    artistName: 'Artits 3'
  ),
  SongModel(
    imagePath: 'assets/images/img4.png',
    imagePerson: 'assets/images/person4.png',
    titleSong: 'Song 4',
    artistName: 'Artist 4'
  )
];