require 'faker'

# Supprimer les enregistrements existants
Cruise.delete_all

# Créer 10 croisières avec des données aléatoires
10.times do
  Cruise.create(
    title: Faker::Lorem.sentence(word_count: 3),
    boat_model: Faker::Vehicle.model,
    itinerary: Faker::Address.full_address,
    starting_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    ending_date: Faker::Date.between(from: 1.year.from_now, to: 2.years.from_now),
    description: Faker::Lorem.paragraph(sentence_count: 3),
    boat_age: Faker::Number.between(from: 1, to: 10),
    owner_id: Faker::Number.between(from: 1, to: 5),
    price: Faker::Number.between(from: 350, to: 1000)
  )
end
