const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Mock data
const recipes = [
  { 
    id: 1, 
    title: 'Pasta Carbonara', 
    servings: "6 Servings",
    ingredients: ['pasta', 'eggs', 'bacon', 'cheese'], 
    instructions: 'Cook pasta according to package instructions. In a separate pan, fry bacon until crispy. In a bowl, whisk together eggs and cheese. Drain cooked pasta and immediately toss with egg and cheese mixture until well coated. Crumble bacon on top and serve immediately.' 
  },
  { 
    id: 2, 
    title: 'Chicken Stir Fry', 
    servings: "3 Servings",
    ingredients: ['chicken breast', 'bell peppers', 'onion', 'garlic', 'soy sauce', 'sesame oil', 'rice'], 
    instructions: 'Slice chicken breast into thin strips. Heat sesame oil in a wok or large skillet over medium-high heat. Add minced garlic and sliced onion, stir fry for 1 minute. Add chicken strips and cook until browned. Add sliced bell peppers and soy sauce, stir fry until vegetables are tender-crisp. Serve over cooked rice.' 
  },
  { 
    id: 3, 
    title: 'Vegetable Curry', 
    servings: "3 Servings",
    ingredients: ['potatoes', 'carrots', 'cauliflower', 'peas', 'onion', 'garlic', 'ginger', 'coconut milk', 'curry powder', 'vegetable broth', 'cilantro', 'rice'], 
    instructions: 'Peel and dice potatoes and carrots. Cut cauliflower into florets. Heat oil in a large pot over medium heat. Add diced onion, minced garlic, and grated ginger, cook until softened. Add curry powder and cook for another minute. Add diced potatoes, carrots, cauliflower, and vegetable broth. Simmer until vegetables are tender. Stir in coconut milk and peas, simmer for another 5 minutes. Serve over cooked rice, garnished with chopped cilantro.' 
  },
  { 
    id: 4, 
    title: 'Spaghetti Bolognese', 
    servings: "1 Servings",
    ingredients: ['spaghetti', 'ground beef', 'onion', 'garlic', 'carrot', 'celery', 'tomato paste', 'canned tomatoes', 'red wine', 'bay leaves', 'thyme', 'parmesan cheese'], 
    instructions: 'Cook spaghetti according to package instructions. In a large skillet, brown ground beef over medium heat. Add diced onion, minced garlic, diced carrot, and diced celery, cook until softened. Stir in tomato paste and cook for 1 minute. Add canned tomatoes, red wine, bay leaves, and thyme. Simmer until sauce thickens. Serve sauce over cooked spaghetti, garnished with grated parmesan cheese.' 
  },
  { 
    id: 5, 
    title: 'Mushroom Risotto',
    servings: "4 Servings", 
    ingredients: ['arborio rice', 'mushrooms', 'onion', 'garlic', 'white wine', 'vegetable broth', 'butter', 'parmesan cheese', 'thyme'], 
    instructions: 'In a saucepan, heat vegetable broth and keep warm over low heat. In a separate pan, melt butter over medium heat. Add diced onion and minced garlic, cook until softened. Add sliced mushrooms and cook until browned. Stir in arborio rice and cook for 1 minute. Add white wine and cook until absorbed. Gradually add warm vegetable broth, stirring frequently, until rice is creamy and tender. Stir in grated parmesan cheese and chopped thyme. Serve immediately.' 
  },
  { 
    id: 6, 
    title: 'Caesar Salad',
    servings: "2 Servings",
    ingredients: ['romaine lettuce', 'croutons', 'parmesan cheese', 'lemon', 'garlic', 'dijon mustard', 'anchovy fillets', 'olive oil', 'salt', 'black pepper'], 
    instructions: 'Wash and dry romaine lettuce, tear into bite-sized pieces. In a small bowl, whisk together minced garlic, lemon juice, dijon mustard, finely chopped anchovy fillets, olive oil, salt, and black pepper to make the dressing. Toss lettuce with dressing until well coated. Top with croutons and shaved parmesan cheese. Serve immediately.' 
  },
  { 
    id: 7, 
    title: 'Beef Tacos',
    servings: "5 Servings",
    ingredients: ['ground beef', 'taco seasoning', 'tortillas', 'lettuce', 'tomato', 'onion', 'cheddar cheese', 'sour cream', 'avocado'], 
    instructions: 'Cook ground beef in a skillet over medium heat until browned. Drain excess fat. Add taco seasoning and water according to package instructions. Warm tortillas in a dry skillet or microwave. Fill each tortilla with seasoned ground beef, shredded lettuce, diced tomato, diced onion, grated cheddar cheese, sour cream, and sliced avocado. Fold tortillas and serve immediately.' 
  },
  { 
    id: 8, 
    title: 'Caprese Salad',
    servings: "2 Servings",
    ingredients: ['tomatoes', 'fresh mozzarella cheese', 'fresh basil leaves', 'balsamic vinegar', 'extra virgin olive oil', 'salt', 'black pepper'], 
    instructions: 'Slice tomatoes and fresh mozzarella cheese into thick slices. Arrange alternating slices of tomato, mozzarella, and fresh basil leaves on a plate. Drizzle with balsamic vinegar and extra virgin olive oil. Season with salt and black pepper. Serve immediately.' 
  },
  { 
    id: 9, 
    title: 'Shrimp Scampi', 
    servings: "1 Servings",
    ingredients: ['shrimp', 'linguine', 'butter', 'garlic', 'white wine', 'lemon juice', 'parsley', 'salt', 'black pepper'], 
    instructions: 'Cook linguine according to package instructions. In a large skillet, melt butter over medium heat. Add minced garlic and cook until fragrant. Add shrimp and cook until pink and opaque. Add white wine and lemon juice, simmer until slightly reduced. Toss cooked linguine with shrimp mixture, chopped parsley, salt, and black pepper. Serve immediately.' 
  },
  { 
    id: 10, 
    title: 'Veggie Burger', 
    servings: "1 Servings",
    ingredients: ['veggie patties', 'burger buns', 'lettuce', 'tomato', 'onion', 'pickles', 'ketchup', 'mustard', 'mayonnaise'], 
    instructions: 'Cook veggie patties according to package instructions. Toast burger buns until golden brown. Assemble burgers by placing veggie patties on bottom buns, topped with lettuce, tomato slices, onion slices, pickles, ketchup, mustard, and mayonnaise. Place top buns on burgers and serve immediately.' 
  },
  { 
    id: 11, 
    title: 'Vegetable Soup',
    servings: "1 Servings", 
    ingredients: ['carrots', 'celery', 'potatoes', 'onion', 'garlic', 'vegetable broth', 'tomatoes', 'green beans', 'corn', 'peas', 'bay leaves', 'thyme', 'salt', 'black pepper'], 
    instructions: 'Dice carrots, celery, potatoes, and onion. Mince garlic. In a large pot, heat olive oil over medium heat. Add diced vegetables and garlic, cook until softened. Add vegetable broth, diced tomatoes, green beans, corn, peas, bay leaves, and thyme. Simmer until vegetables are tender. Season with salt and black pepper. Serve hot.' 
  },
  { 
    id: 12, 
    title: 'Spinach and Feta Stuffed Chicken Breast',
    servings: "2 Servings", 
    ingredients: ['chicken breast', 'spinach', 'feta cheese', 'garlic', 'lemon zest', 'salt', 'black pepper', 'olive oil'], 
    instructions: 'Preheat oven to 375°F (190°C). Butterfly chicken breasts and pound to an even thickness. In a bowl, mix together chopped spinach, crumbled feta cheese, minced garlic, and lemon zest. Season with salt and black pepper. Spoon spinach and feta mixture onto each chicken breast. Roll up chicken breasts and secure with toothpicks. Heat olive oil in an oven-safe skillet over medium-high heat. Sear chicken breasts until golden brown on all sides. Transfer skillet to preheated oven and bake for 20-25 minutes, or until chicken is cooked through. Remove toothpicks before serving.' 
  },
  { 
    id: 13, 
    title: 'Beef Lasagna', 
    servings: "2 Servings",
    ingredients: ['lasagna noodles', 'ground beef', 'onion', 'garlic', 'canned tomatoes', 'tomato paste', 'dried oregano', 'dried basil', 'salt', 'black pepper', 'ricotta cheese', 'mozzarella cheese', 'parmesan cheese', 'egg'], 
    instructions: 'Cook lasagna noodles according to package instructions. In a large skillet, brown ground beef over medium heat. Add diced onion and minced garlic, cook until softened. Stir in canned tomatoes, tomato paste, dried oregano, dried basil, salt, and black pepper. Simmer until sauce thickens. In a separate bowl, mix together ricotta cheese, shredded mozzarella cheese, grated parmesan cheese, and beaten egg. Preheat oven to 375°F (190°C). Spread a thin layer of meat sauce in the bottom of a baking dish. Layer cooked lasagna noodles, meat sauce, and cheese mixture. Repeat layers, ending with a layer of meat sauce on top. Cover with foil and bake for 30 minutes. Remove foil and bake for an additional 15 minutes, or until bubbly and golden brown. Let lasagna rest for 10 minutes before slicing and serving.' 
  },
  { 
    id: 14, 
    title: 'Beef Chili', 
    servings: "3 Servings",
    ingredients: ['ground beef', 'onion', 'bell peppers', 'garlic', 'canned tomatoes', 'tomato paste', 'kidney beans', 'chili powder', 'cumin', 'paprika', 'cayenne pepper', 'salt', 'black pepper', 'olive oil'], 
    instructions: 'Heat olive oil in a large pot over medium heat. Add diced onion, minced garlic, and diced bell peppers, cook until softened. Add ground beef and cook until browned. Stir in canned tomatoes, tomato paste, drained kidney beans, chili powder, cumin, paprika, cayenne pepper, salt, and black pepper. Simmer for at least 30 minutes, stirring occasionally. Serve hot, garnished with shredded cheddar cheese, diced onion, and chopped cilantro.' 
  },
  { 
    id: 15, 
    title: 'Teriyaki Salmon',
    servings: "3 Servings", 
    ingredients: ['salmon fillets', 'soy sauce', 'brown sugar', 'honey', 'ginger', 'garlic', 'sesame oil', 'green onions', 'sesame seeds'], 
    instructions: 'In a small bowl, whisk together soy sauce, brown sugar, honey, grated ginger, minced garlic, and sesame oil to make the teriyaki sauce. Preheat grill or grill pan over medium-high heat. Brush salmon fillets with teriyaki sauce and place on grill, skin-side down. Cook for 4-5 minutes, then flip and cook for another 4-5 minutes, or until salmon is cooked through and flakes easily with a fork. Brush with additional teriyaki sauce while cooking if desired. Serve hot, garnished with sliced green onions and sesame seeds.' 
  },
  { 
    id: 16, 
    title: 'Homemade Pizza',
    servings: "4 Servings", 
    ingredients: ['pizza dough', 'tomato sauce', 'mozzarella cheese', 'pepperoni', 'bell peppers', 'mushrooms', 'onion', 'olive oil', 'garlic', 'oregano', 'basil', 'red pepper flakes'], 
    instructions: 'Preheat oven to 475°F (245°C). Roll out pizza dough on a lightly floured surface to desired thickness. Transfer to a baking sheet or pizza stone. Spread tomato sauce evenly over dough, leaving a small border around the edges. Sprinkle shredded mozzarella cheese over sauce. Arrange sliced pepperoni, diced bell peppers, sliced mushrooms, and diced onion over cheese. Drizzle with olive oil and sprinkle minced garlic, dried oregano, dried basil, and red pepper flakes over toppings. Bake for 12-15 minutes, or until crust is golden brown and cheese is bubbly. Slice and serve hot.' 
  },
  { 
    id: 17, 
    title: 'Chicken Enchiladas', 
    servings: "3 Servings",
    ingredients: ['cooked chicken', 'tortillas', 'enchilada sauce', 'bell peppers', 'onion', 'cheddar cheese', 'sour cream', 'avocado', 'cilantro'], 
    instructions: 'Preheat oven to 375°F (190°C). Spread a thin layer of enchilada sauce in the bottom of a baking dish. Warm tortillas in a dry skillet or microwave. Fill each tortilla with cooked chicken, diced bell peppers, diced onion, and grated cheddar cheese. Roll up tortillas and place seam-side down in the baking dish. Pour remaining enchilada sauce over the top. Cover with foil and bake for 20 minutes. Remove foil and bake for an additional 10 minutes, or until heated through and bubbly. Serve hot, garnished with sour cream, sliced avocado, and chopped cilantro.' 
  },
  { 
    id: 18, 
    title: 'Beef Stroganoff', 
    servings: "5 Servings",
    ingredients: ['beef sirloin', 'onion', 'mushrooms', 'beef broth', 'sour cream', 'dijon mustard', 'worcestershire sauce', 'flour', 'butter', 'egg noodles', 'parsley'], 
    instructions: 'Slice beef sirloin into thin strips. In a large skillet, melt butter over medium-high heat. Add sliced onion and mushrooms, cook until softened. Remove vegetables from skillet and set aside. In the same skillet, cook beef strips until browned. Sprinkle flour over beef and stir to coat. Gradually add beef broth, dijon mustard, and worcestershire sauce, stirring constantly. Bring to a simmer and cook until sauce thickens. Stir in sour cream until combined. Return cooked vegetables to skillet and heat through. Serve over cooked egg noodles, garnished with chopped parsley.' 
  },
  { 
    id: 19, 
    title: 'Tuna Salad Sandwich',
    servings: "2 Servings",
    ingredients: ['canned tuna', 'mayonnaise', 'celery', 'red onion', 'dill pickles', 'lemon juice', 'salt', 'black pepper', 'lettuce', 'tomato', 'whole wheat bread'], 
    instructions: 'Drain canned tuna and place in a bowl. Add mayonnaise, finely chopped celery, finely diced red onion, diced dill pickles, lemon juice, salt, and black pepper. Mix until well combined. Toast whole wheat bread slices until golden brown. Spread tuna salad mixture onto toasted bread slices. Top with lettuce, tomato slices, and another slice of bread. Serve immediately.' 
  },
  { 
    id: 20, 
    title: 'Vegetable Lo Mein', 
    servings: "1 Servings",
    ingredients: ['egg noodles', 'bell peppers', 'carrots', 'broccoli', 'mushrooms', 'snow peas', 'garlic', 'ginger', 'soy sauce', 'sesame oil', 'green onions'], 
    instructions: 'Cook egg noodles according to package instructions. In a large skillet or wok, heat sesame oil over medium-high heat. Add minced garlic and grated ginger, cook until fragrant. Add sliced bell peppers, julienned carrots, broccoli florets, sliced mushrooms, and snow peas, stir fry until vegetables are tender-crisp. Add cooked egg noodles and soy sauce, toss to combine. Garnish with sliced green onions and serve hot.' 
  }
];

app.get('/recipes/filter', (req, res) => {
  const { ingredients } = req.query;

  if (!ingredients) {
    return res.status(400).json({ error: 'No ingredients specified' });
  }

  // Convert ingredients string to array
  const ingredientList = ingredients.split(',');

  // Find recipes that contain all specified ingredients
  const matchingRecipes = recipes.filter(recipe => ingredientList.every(ingredient => recipe.ingredients.includes(ingredient)));

  res.json(matchingRecipes);
});
// Endpoint to get all recipes
app.get('/recipes', (req, res) => {
  res.json(recipes);
});

// Endpoint to get a specific recipe by ID
app.get('/recipes/:id', (req, res) => {
  const recipe = recipes.find(recipe => recipe.id === parseInt(req.params.id));
  if (recipe) {
    res.json(recipe);
  } else {
    res.status(404).json({ error: 'Recipe not found' });
  }
});




app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
