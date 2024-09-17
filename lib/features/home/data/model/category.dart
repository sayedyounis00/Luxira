class CategoryModel {
  final String title;
  final String image;

  CategoryModel({required this.title, required this.image});
}

List<CategoryModel> categorie = [
  CategoryModel(title: 'Clothes', image: 'assets/images/fashion 1.png'),
  CategoryModel(title: 'MakeUp', image: 'assets/images/makeup 1.png'),
  CategoryModel(title: 'Electronics', image: 'assets/images/gadgets.png'),
  CategoryModel(title: 'smartphone', image: 'assets/images/smartphone.png'),
  CategoryModel(title: 'kitchen', image: 'assets/images/chef.png'),
  CategoryModel(title: 'shoes', image: 'assets/images/shoes.png'),
];
