import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_book/screens/recipe_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<dynamic>> fetchRecipes() async {
    final url = Uri.parse('http://10.0.2.2:3000/recipes');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['recipes'];
      } else {
        print('Error {$response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error in request');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: fetchRecipes(),
        builder: (context, snapshot) {
          final recipes = snapshot.data ?? [];
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No recipes found'));
          } else {
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return _recipesCard(context, recipes[index]);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _showBotton(context);
        },
      ),
    );
  }

  Future<void> _showBotton(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 600,
        color: Colors.white,
        child: const RecipeForm(),
      ),
    );
  }

  Widget _recipesCard(BuildContext context, dynamic recipe) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(recipeName: recipe['name']),
          ),
        ),
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Card(
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 125,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      recipe['image_link'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.grey[400],
                            size: 50,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 26),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      recipe['name'],
                      style: TextStyle(fontSize: 16, fontFamily: 'QuickSand'),
                    ),
                    SizedBox(height: 4),
                    Container(height: 2, width: 75, color: Colors.orange),
                    Text(
                      recipe['author'],
                      style: TextStyle(fontSize: 16, fontFamily: 'QuickSand'),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController recipeName = TextEditingController();
    final TextEditingController authorName = TextEditingController();
    final TextEditingController imageUrl = TextEditingController();
    final TextEditingController recipeDescription = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Recipe',
              style: TextStyle(color: Colors.orange, fontSize: 24),
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: recipeName,
              label: 'Recipe Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name recipe';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: authorName,
              label: 'Author',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name author';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: imageUrl,
              label: 'Image Url',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the image url';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              maxLines: 4,
              controller: recipeDescription,
              label: 'Recipe',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the recipe';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Save Recipe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontFamily: 'QuickSand', color: Colors.orange),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
      maxLines: maxLines,
    );
  }
}
