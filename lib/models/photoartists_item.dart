class GridItemModel {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int rating;
  final List<String> chips;
  final bool verified;

  GridItemModel(
      {required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.rating,
      required this.chips,
      required this.verified});
}

List<GridItemModel> gridItems = [
  GridItemModel(
    imageUrl: 'assets/images/Cover_copy.jpg',
    title: 'Naveen Jhonson',
    subtitle: 'Starts from 27,999/-',
    rating: 4,
    chips: ['User Choice', 'Exp: 5+ Yrs'],
    verified: false,
  ),
  GridItemModel(
    imageUrl: 'assets/images/first.png',
    title: 'Click N Weds',
    subtitle: 'Starts from 14,999/-',
    rating: 4,
    chips: ['User Choice', 'Exp: 5+ Yrs'],
    verified: true,
  ),
  GridItemModel(
    imageUrl: 'assets/images/pari.png',
    title: 'Chitralok 1968',
    subtitle: 'Starts from 69,999/-',
    rating: 4,
    chips: ['User Choice', 'Exp: 5+ Yrs'],
    verified: false,
  ),
  GridItemModel(
    imageUrl: 'assets/images/pari.png',
    title: 'Item 2',
    subtitle: 'Subtitle 2',
    rating: 4,
    chips: ['User Choice', 'Exp: 5+ Yrs'],
    verified: false,
  ),
  GridItemModel(
    imageUrl: 'assets/images/first.png',
    title: 'Raj Thukral',
    subtitle: 'Starts from 7,999/-',
    rating: 4,
    chips: ['User Choice', 'Exp: 5+ Yrs'],
    verified: true,
  ),
  GridItemModel(
    imageUrl: 'assets/images/Cover_copy.jpg',
    title: 'Item 2',
    subtitle: 'Subtitle 2',
    rating: 4,
    chips: ['User Choice', 'Exp: 5+ Yrs'],
    verified: false,
  ),
];
