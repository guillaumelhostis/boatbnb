require 'faker'

# Supprimer les enregistrements existants
Cruise.delete_all
User.delete_all

kiki = User.create(
  first_name: "Kiki",
  last_name: "Dee",
  gender: "Female",
  date_of_birth: "1995-12-29",
  email: "kiki@gmail.com",
  password: "hellokiki",
  address: "42 bis rue des lilas",
  postcode: 92160,
  city: "ANTONY",
  sailing_experience: "I'm a beginner",
  description: "Hi, my name is Kiki, i'm Canadian and i love sailing",
  admin: false
)

serge = User.create(
  first_name: "Serge",
  last_name: "Dupont",
  gender: "Male",
  date_of_birth: "1978-10-08",
  email: "serge@free.fr",
  password: "serge9092",
  address: "10 rue de Rome",
  postcode: 75012,
  city: "PARIS",
  sailing_experience: "I'm a pro sailor",
  description: "Hi, my name is Kiki, i'm Parisian but i'm not annoying",
  admin: false
)

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
  sailing_experience: "I hate sailing",
  description: "I'm the admin of Boatbnb",
  admin: true
)

kiki_cruise_one = Cruise.create(
  title: "Voyagez au bout du monde avec Kiki",
  boat_model: "Outremer 45",
  itinerary: "Brest - Fort de France",
  starting_date: "2023-06-10",
  ending_date: "2023-07-10",
  description: "Transat des alisées sur un catamaran dernier cri",
  boat_age: 2,
  owner_id: kiki[:id],
  price: 700
)

kiki_cruise_two = Cruise.create(
  title: "Les Maldives avec Kiki",
  boat_model: "Outremer 45",
  itinerary: "Brest - Les Maldives",
  starting_date: "2023-09-01",
  ending_date: "2023-10-10",
  description: "Ca va secouer",
  boat_age: 2,
  owner_id: kiki[:id],
  price: 600
)

serge_cruise = Cruise.create(
  title: "La ballade de Serge",
  boat_model: "Catana 35",
  itinerary: "Roscoff- Jersey",
  starting_date: "2023-06-18",
  ending_date: "2023-06-20",
  description: "Pas trop vite mais pas trop doucement non plus",
  boat_age: 2,
  owner_id: serge[:id],
  price: 60
)

Booking.delete_all

Booking.create(
  cruise_id: kiki_cruise_one[:id],
  customer_id: serge[:id],
  status: "Waiting for approval"
)

Booking.create(
  cruise_id: kiki_cruise_two[:id],
  customer_id: serge[:id],
  status: "Waiting for approval"
)

Booking.create(
  cruise_id: serge_cruise[:id],
  customer_id: kiki[:id],
  status: "Waiting for approval"
)
