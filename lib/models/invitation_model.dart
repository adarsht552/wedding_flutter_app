class InvitationModel {
  final String imagePath;
  final String title;
  final String price;
  final String originalPrice;
  final List<String> chipLabels;
  final String description;
  final String rating;

  InvitationModel({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.chipLabels,
    required this.description,
    required this.rating,
  });
}

final List<InvitationModel> invitations = [
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    title: 'Royal Rajasthani',
    price: '7,500',
    originalPrice: '10000',
    chipLabels: ['User Choice', 'Popular'],
    description:
        'Immerse in the grandeur of Rajasthan with this regal invite, featuring intricate designs inspired by royal palaces.',
    rating: '4.6',
  ),
  InvitationModel(
    imagePath: 'assets/images/pari.png',
    title: 'Gujarati Special',
    price: '6,500',
    originalPrice: '9000',
    chipLabels: ['New Arrival', 'Popular'],
    description:
        'Immerse in the grandeur of Rajasthan with this regal invite, featuring intricate designs inspired by royal palaces.',
    rating: '4.6',
  ),
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    title: 'Gujarati Special',
    price: '6,500',
    originalPrice: '9000',
    chipLabels: ['New Arrival', 'Popular'],
    description:
        'Immerse in the grandeur of Rajasthan with this regal invite, featuring intricate designs inspired by royal palaces.',
    rating: '4.6',
  ),
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    title: 'Gujarati Special',
    price: '6,500',
    originalPrice: '9000',
    chipLabels: ['New Arrival', 'Popular'],
    description:
        'Immerse in the grandeur of Rajasthan with this regal invite, featuring intricate designs inspired by royal palaces.',
    rating: '4.6',
  ),
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    title: 'Gujarati Special',
    price: '6,500',
    originalPrice: '9000',
    chipLabels: ['New Arrival', 'Popular'],
    description: 'this is a short description',
    rating: '4.6',
  ),
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    title: 'Gujarati Special',
    price: '6,500',
    originalPrice: '9000',
    chipLabels: ['New Arrival', 'Popular'],
    description: 'this is a short description',
    rating: '4.6',
  ),
];
