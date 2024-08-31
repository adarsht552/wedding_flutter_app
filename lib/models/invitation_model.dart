class InvitationModel {
  final String imagePath;
  final String location;
  final double price;
  final double originalPrice;
  final List<String> chipLabels;

  InvitationModel({
    required this.imagePath,
    required this.location,
    required this.price,
    required this.originalPrice,
    required this.chipLabels,
  });
}

final List<InvitationModel> invitations = [
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    location: 'Royal Rajasthani',
    price: 7500,
    originalPrice: 10000,
    chipLabels: ['User Choice', 'Popular'],
  ),
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    location: 'Gujarati Special',
    price: 6500,
    originalPrice: 9000,
    chipLabels: ['New Arrival', 'Popular'],
  ),
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    location: 'Gujarati Special',
    price: 6500,
    originalPrice: 9000,
    chipLabels: ['New Arrival', 'Popular'],
  ),
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    location: 'Gujarati Special',
    price: 6500,
    originalPrice: 9000,
    chipLabels: ['New Arrival', 'Popular'],
  ),
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    location: 'Gujarati Special',
    price: 6500,
    originalPrice: 9000,
    chipLabels: ['New Arrival', 'Popular'],
  ),
  InvitationModel(
    imagePath: 'assets/images/homelander.jpeg',
    location: 'Gujarati Special',
    price: 6500,
    originalPrice: 9000,
    chipLabels: ['New Arrival', 'Popular'],
  ),
];
