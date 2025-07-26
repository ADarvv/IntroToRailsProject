# Clear existing data
Product.destroy_all
Category.destroy_all
User.destroy_all

# Create categories predefined
categories = [
  { name: "Gym Equipment", description: "Resistance bands, lifting straps, gloves, belts", slug: "gym-equipment" },
  { name: "Supplements", description: "Protein powders, pre-workout, BCAAs, creatine", slug: "supplements" },
  { name: "Health Products", description: "Vitamins, minerals, recovery supplements", slug: "health-products" },
  { name: "Accessories", description: "Shaker bottles, gym bags, water bottles", slug: "accessories" }
]

categories.each do |cat_data|
  Category.create!(cat_data)
end

# Create users using faker
20.times do
  User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number
  )
end

# ADding products using predefined data
products_data = [
  { name: "Resistance Band Set", description: "Heavy duty latex resistance bands", price: 29.99, sku: "RB001", category: "Gym Equipment" },
  { name: "Whey Protein Powder", description: "25g protein per serving", price: 59.99, sku: "WP001", category: "Supplements" },
  { name: "Pre-Workout Formula", description: "Energy boost for workouts", price: 39.99, sku: "PW001", category: "Supplements" },
  { name: "Lifting Straps", description: "Padded lifting straps", price: 19.99, sku: "LS001", category: "Gym Equipment" },
  { name: "BCAA Powder", description: "Branch chain amino acids", price: 34.99, sku: "BC001", category: "Supplements" },
  { name: "Gym Gloves", description: "Breathable workout gloves", price: 24.99, sku: "GG001", category: "Gym Equipment" },
  { name: "Shaker Bottle", description: "BPA-free protein shaker", price: 12.99, sku: "SB001", category: "Accessories" },
  { name: "Creatine Monohydrate", description: "Pure creatine powder", price: 29.99, sku: "CR001", category: "Supplements" },
  { name: "Vitamin D3", description: "High potency vitamin D", price: 18.99, sku: "VD001", category: "Health Products" },
  { name: "Gym Bag", description: "Durable workout bag", price: 49.99, sku: "GB001", category: "Accessories" }
]

# Adding products using faker
30.times do
  category = Category.all.sample
  products_data << {
    name: "#{Faker::Commerce.product_name} #{category.name.singularize}",
    description: Faker::Lorem.sentence(word_count: 8),
    price: Faker::Commerce.price(range: 15.0..99.99),
    sku: Faker::Alphanumeric.alphanumeric(number: 6).upcase,
    category: category.name
  }
end

products_data.each do |product_data|
  category = Category.find_by(name: product_data[:category])
  Product.create!(
    name: product_data[:name],
    description: product_data[:description],
    current_price: product_data[:price],
    sku: product_data[:sku],
    stock_quantity: rand(0..100),
    category: category,
    is_active: true
  )
end

puts "Created #{Category.count} categories"
puts "Created #{Product.count} products"
puts "Created #{User.count} users"