require './models/food'
foods = [
  {
    name: "Caviar",
    course: "Appetizers", allergens: "fish",
    price: "45"
  },
  {
    name: "Foie Gras",
    course: "Appetizers",
    allergens: "fish",
    price: "40"
  },
  {
    name: "Heirloom Tomato Salad",
    course: "Appetizers",
    allergens: "eggs",
    price: "15"
  },
  {
    name: "Fried Pickles",
    course: "Appetizers",
    allergens: "none",
    price: "12"
  },
  {
    name: "Spinach and Artichoke Dip",
    course: "Appetizers",
    allergens: "lactose",
    price: "10"
  },
  {
    name: "Fried Calamari",
    course: "Appetizers",
    allergens: "fish",
    price: "11"
  },
  {
    name: "French Onion Soup",
    course: "Appetizers",
    allergens: "fish",
    price: "12"
  },
  {
    name: "Carpaccio",
    course: "Appetizers",
    allergens: "none",
    price: "18"
  },
  {
    name: "Crispy Fried Wontons",
    course: "Appetizers",
    allergens: "soy",
    price: "15"
  },
  {
    name: "Crudite",
    course: "Appetizers",
    allergens: "none",
    price: "12"
  },
  {
    name: "Carpaccio",
    course: "Drinks",
    allergens: "none",
    price: "18"
  },
  {
    name: "Coke",
    course: "Drinks",
    allergens: "none",
    price: "5"
  },
  {
    name: "Lemonade",
    course: "Drinks",
    allergens: "none",
    price: "5"
  },
  {
    name: "Pale Ale",
    course: "Drinks",
    allergens: "none",
    price: "8"
  },
  {
    name: "Hard Cider",
    course: "Drinks",
    allergens: "none",
    price: "10"
  },
  {
    name: "Vodka Martini",
    course: "Drinks",
    allergens: "none",
    price: "13"
  },
  {
    name: "Chocolate Milk",
    course: "Drinks",
    allergens: "lactose",
    price: "6"
  },
  {
    name: "Passionfruit Juice",
    course: "Drinks",
    allergens: "none",
    price: "6"
  },
  {
    name: "Sparkling Mineral Water",
    course: "Drinks",
    allergens: "none",
    price: "3"
  },
  {
    name: "Manhattan",
    course: "Drinks",
    allergens: "none",
    price: "13"
  },
  {
    name: "Cosmopolitan",
    course: "Drinks",
    allergens: "none",
    price: "14"
  },
  {
    name: "Filet Mignon",
    course: "Entrees",
    allergens: "none",
    price: "55"
  },
  {
    name: "Chicken Cordon Bleu",
    course: "Entrees",
    allergens: "lactose",
    price: "45"
  },
  {
    name: "Rigatoni Alla Vodka",
    course: "Entrees",
    allergens: "none",
    price: "28"
  },
  {
    name: "Lasagna",
    course: "Entrees",
    allergens: "lactose",
    price: "23"
  },
  {
    name: "Roast Chicken",
    course: "Entrees",
    allergens: "none",
    price: "30"
  },
  {
    name: "Whole Bronzino",
    course: "Entrees",
    allergens: "fish",
    price: "38"
  },
  {
    name: "Soft Shell Crab(seasonal)",
    course: "Entrees",
    allergens: "fish",
    price: "40"
  },
  {
    name: "Vegetarian Chili",
    course: "Entrees",
    allergens: "none",
    price: "26"
  },
  {
    name: "Pork Chops",
    course: "Entrees",
    allergens: "none",
    price: "40"
  },
  {
    name: "Bouillabaisse",
    course: "Entrees",
    allergens: "none",
    price: "50"
  },
  {
    name: "Creamed Spinach",
    course: "Sides",
    allergens: "lactose",
    price: "15"
  },
  {
    name: "French Fries",
    course: "Sides",
    allergens: "none",
    price: "12"
  },
  {
    name: "Sweet Potato Fries",
    course: "Sides",
    allergens: "none",
    price: "15"
  },
  {
    name: "Roasted Carrots",
    course: "Sides",
    allergens: "none",
    price: "10"
  },
  {
    name: "Steamed Broccoli",
    course: "Sides",
    allergens: "none",
    price: "10"
  },
  {
    name: "Artichoke Hearts",
    course: "Sides",
    allergens: "none",
    price: "12"
  },
  {
    name: "Slab Bacon",
    course: "Sides",
    allergens: "none",
    price: "12"
  },
  {
    name: "Corn on the Cob",
    course: "Sides",
    allergens: "none",
    price: "11"
  },
  {
    name: "Brussel Sprouts",
    course: "Sides",
    allergens: "none",
    price: "8"
  },
  {
    name: "Roasted Fennel",
    course: "Sides",
    allergens: "none",
    price: "8"
  },
  {
    name: "Creme Brulee",
    course: "Desserts",
    allergens: "lactose",
    price: "16"
  },
  {
    name: "Ice Cream Sandwich",
    course: "Desserts",
    allergens: "lactose",
    price: "10"
  },
  {
    name: "Sorbet",
    course: "Desserts",
    allergens: "none",
    price: "10"
  },
  {
    name: "Warm Chocolate Cake",
    course: "Desserts",
    allergens: "lactose",
    price: "15"
  },
  {
    name: "Profiterole",
    course: "Desserts",
    allergens: "lactose",
    price: "18"
  },
  {
    name: "Tiramisu",
    course: "Desserts",
    allergens: "lactose",
    price: "17"
  },
  {
    name: "Chocolate Chip Cookie",
    course: "Desserts",
    allergens: "none",
    price: "10"
  },
  {
    name: "Brownie",
    course: "Desserts",
    allergens: "none",
    price: "9"
  },
  {
    name: "S'mores",
    course: "Desserts",
    allergens: "none",
    price: "11"
  },
  {
    name: "Apple Pie Crumble",
    course: "Desserts",
    allergens: "none",
    price: "12"
  }
]
foods.each do |food|
  Food.create(food)
end
