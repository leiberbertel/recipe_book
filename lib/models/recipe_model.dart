class Recipe {
  int id;
  String name;
  String author;
  String urlLink;
  List<String> recipeSteps;

  Recipe({
    required this.id,
    required this.name,
    required this.author,
    required this.urlLink,
    required this.recipeSteps,
  });

  factory Recipe.fromJSON(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      urlLink: json['image_link'],
      recipeSteps: List<String>.from(json['recipe']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'image_link': urlLink,
      'recipe': recipeSteps,
    };
  }

  @override
  String toString() {
    return 'Recipe{id: $id, name: $name, author: $author, urlLink: $urlLink, recipe: $recipeSteps}';
  }
}
