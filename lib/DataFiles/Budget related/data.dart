class Recipe {

  String title;
  String description;
  String image;
  int calories;
  int carbo;
  int protein;

  Recipe(this.title, this.description, this.image, this.calories, this.carbo, this.protein);

}

List<Recipe> getRecipes(){
  return <Recipe>[
    Recipe("Chicken Fried Rice", "So irresistibly delicious", "assets/AppDrawerRelatedImages/chicken_fried_rice.png", 250, 35, 6),
    Recipe("Pasta Bolognese", "True Italian classic with a meaty, chilli sauce", "assets/AppDrawerRelatedImages/pasta_bolognese.png", 200, 45, 10),
    Recipe("Garlic Potatoes", "Crispy Garlic Roasted Potatoes", "assets/AppDrawerRelatedImages/filete_con_papas_cambray.png", 150, 30, 8),
    Recipe("Asparagus", "White Onion, Fennel, and watercress Salad", "assets/AppDrawerRelatedImages/asparagus.png", 190, 35, 12),
    Recipe("Filet Mignon", "Bacon-Wrapped Filet Mignon", "assets/AppDrawerRelatedImages/steak_bacon.png", 250, 55, 20),
  ];
}