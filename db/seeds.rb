# require 'faker'
require 'open-uri'

# Supprimer les enregistrements existants
puts "cleaning DB...."
Review.delete_all
Booking.delete_all # important de respecter cet ordre de suppression
Cruise.delete_all
User.delete_all

urls = [
  "https://res.cloudinary.com/dtpxg9mp5/image/upload/v1686083611/development/sn7x21tyf1l7i8vusfh6yrs57f97.jpg",
  "https://res.cloudinary.com/dtpxg9mp5/image/upload/v1686083609/development/jm4xf2390hk9g8ly2j7yklq0cf3j.jpg",
  "https://res.cloudinary.com/dtpxg9mp5/image/upload/v1686083607/development/gonz7sp7xxuf3ekjn5t7n6fqhx7o.jpg"
]
# creation de 3 Users
puts "creating some Users...."
paul = User.create(
  first_name: "Paul",
  last_name: "Dano",
  gender: "Male",
  date_of_birth: "1995-12-29",
  email: "paul@gmail.com",
  password: "paul92",
  address: "42 bis rue des lilas",
  postcode: 92160,
  city: "ANTONY",
  sailing_experience: "Professional Sailor",
  description: "Hi, my name is Paul and i been sailing around the globe since 10 years",
  admin: false
)

marie = User.create(
  first_name: "Marie",
  last_name: "Dupont",
  gender: "Female",
  date_of_birth: "1978-10-08",
  email: "marie@gmail.com",
  password: "marie92",
  address: "10 rue de Rome",
  postcode: 75012,
  city: "PARIS",
  sailing_experience: "I'm a total beginner",
  description: "Hi, my name is Marie, i'm Parisian but i'm not annoying",
  admin: false
)

alice = User.create(
  first_name: "Alice",
  last_name: "Brevost",
  gender: "Female",
  date_of_birth: "1995-09-06",
  email: "alice@gmail.com",
  password: "alice92",
  address: "10 rue de l'amour",
  postcode: 75015,
  city: "PARIS",
  sailing_experience: "I sail a bit as a hobbie",
  description: "Hi, my name is Alice and i love skateboard and surf",
  admin: false
)

# creation d'un Amdin
User.create(
  first_name: "Guillaume",
  last_name: "L'Hostis",
  gender: "Male",
  date_of_birth: "1992-09-28",
  email: "guillaume.lhostis@free.fr",
  password: "lewagon9092",
  address: "42 bis rue des roses",
  postcode: 92160,
  city: "ANTONY",
  sailing_experience: "I don't care about sailing i'm here to make money",
  description: "I'm the admin of Boatbnb",
  admin: true
)

# file = URI.open("https://console.cloudinary.com/console/c-87918e3e31eb2fdaa45643ba19eebc/media_library/search/asset/a23186afb744edac9ef5464976b531c0/manage?q=&context=manage")
puts "creating some Cruises...."
paul_cruise_one = Cruise.create(
  title: "Voyage au bout du monde",
  boat_model: "Outremer 45",
  from: "Brest",
  to: "Concarneau",
  itinerary: "Brest - Concarneau",
  starting_date: "2023-06-10",
  ending_date: "2023-07-10",
  description: "Tour de Bretagne sur un catamaran dernier cri",
  boat_age: 2,
  owner_id: paul[:id],
  price: 700,
  capacity: 4
)

# paul_cruise_one.photos.attach(io: file, filename: "sn7x21tyf1l7i8vusfh6yrs57f97.png", content_type: "image/png")

# paul_cruise_one.save

Cruise.create(
  title: "Escapade en Corse",
  boat_model: "Outremer 45",
  from: "Bastia",
  to: "Ajaccio",
  itinerary: "Bastia - Ajaccio",
  starting_date: "2023-09-01",
  ending_date: "2023-10-10",
  description: "Ca va bronzer sec",
  boat_age: 2,
  owner_id: paul[:id],
  price: 600,
  capacity: 4
)

Cruise.create(
  title: "Les îles Anglo - Normandes",
  boat_model: "Catana 35",
  from: "Roscoff",
  to: "Jersey",
  itinerary: "Roscoff - Jersey",
  starting_date: "2023-06-18",
  ending_date: "2023-06-20",
  description: "Pas trop vite mais pas trop doucement non plus, on va boire du cidre",
  boat_age: 2,
  owner_id: marie[:id],
  price: 60,
  capacity: 6
)

# Booking.create(
#   cruise_id: paul_cruise_one[:id],
#   customer_id: marie[:id],
#   status: "Waiting for approval"
# )

# Booking.create(
#   cruise_id: paul_cruise_two[:id],
#   customer_id: marie[:id],
#   status: "Waiting for approval"
# )

# Booking.create(
#   cruise_id: serge_cruise[:id],
#   customer_id: kiki[:id],
#   status: "Waiting for approval"
# )

all_cruises = Cruise.all

all_cruises.each do |cruise|
  urls.each do |url|
    file = URI.open(url)
    cruise.photos.attach(io: file, filename: "#{SecureRandom.hex}.jpg", content_type: "image/jpeg")
  end
end

puts "creating some Bookings...."

Booking.create(
  cruise_id: paul_cruise_one[:id],
  customer_id: alice[:id],
  status: "Waiting for approval",
  user_description: "Bonjour je m'appelle Alice et j'aimerai rejoindre votre bord",
  number_of_passengers: 1
)

puts "finished!"
