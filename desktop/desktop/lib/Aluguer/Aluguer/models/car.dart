class Car {
  final String category;
  final String model;
  final String image;
  final int passengers;
  final int largeBags;
  final int smallBags;
  final String transmission;
  final double rating;
  final double pricePerDay;

  Car({
    required this.category,
    required this.model,
    required this.image,
    required this.passengers,
    required this.largeBags,
    required this.smallBags,
    required this.transmission,
    required this.rating,
    required this.pricePerDay,
  });

  double getTotalPrice(int days) => pricePerDay * days;
}

final List<Car> sampleCars = [
  Car(
    category: 'Carro Médio',
    model: 'Fiat Panda',
    image: 'https://api.builder.io/api/v1/image/assets/TEMP/b4033a5e9fd8a35355bc0b5fa699117a94b44ee4?width=540',
    passengers: 5,
    largeBags: 1,
    smallBags: 1,
    transmission: 'Manual',
    rating: 7.6,
    pricePerDay: 27,
  ),
  Car(
    category: 'SUV',
    model: 'BYD Seal U',
    image: 'https://api.builder.io/api/v1/image/assets/TEMP/6e65768da5729552869cd5ae1e68949e0bdfb1d2?width=540',
    passengers: 5,
    largeBags: 3,
    smallBags: 1,
    transmission: 'Automático',
    rating: 8.8,
    pricePerDay: 55,
  ),
  Car(
    category: 'Carro Grande',
    model: 'Ford Kuga',
    image: 'https://api.builder.io/api/v1/image/assets/TEMP/245518e39027135ae23cc4d94f872599f5be845a?placeholderIfAbsent=true&apiKey=d76d98ee36214baeada1c567f1329b8e?width=538',
    passengers: 5,
    largeBags: 2,
    smallBags: 2,
    transmission: 'Manual',
    rating: 6.3,
    pricePerDay: 39,
  ),
  Car(
    category: 'Carro Premium',
    model: 'Porsche 991',
    image: 'https://api.builder.io/api/v1/image/assets/TEMP/727e83db49c18975f063a9b132bd14822ac3f7e7?placeholderIfAbsent=true&apiKey=d76d98ee36214baeada1c567f1329b8e?width=538',
    passengers: 3,
    largeBags: 1,
    smallBags: 1,
    transmission: 'Automático',
    rating: 9.6,
    pricePerDay: 124,
  ),
];
