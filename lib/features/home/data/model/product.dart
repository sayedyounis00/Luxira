class Product {
  final String image;
  final String title;
  final String oldPrice;
  final String newPrice;

  Product(
      {required this.image,
      required this.title,
      required this.oldPrice,
      required this.newPrice});
}

List<Product> product = [
  Product(
    image: 'assets/images/Frame 893.png',
    title: 'Product1',
    oldPrice: '300',
    newPrice: '200',
  ),
  Product(
    image: 'assets/images/Frame 893.png',
    title: 'Product2',
    oldPrice: '300',
    newPrice: '200',
  ),
  Product(
    image: 'assets/images/Frame 893.png',
    title: 'Product3',
    oldPrice: '300',
    newPrice: '200',
  ),
  Product(
    image: 'assets/images/Frame 893.png',
    title: 'Product4',
    oldPrice: '300',
    newPrice: '200',
  ),
  Product(
    image: 'assets/images/Frame 893.png',
    title: 'Product5',
    oldPrice: '300',
    newPrice: '200',
  ),
];
