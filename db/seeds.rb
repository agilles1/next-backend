# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Audition.destroy_all
Audition.reset_pk_sequence

Candidate.destroy_all
Candidate.reset_pk_sequence

Room.destroy_all
Room.reset_pk_sequence


a = Audition.create(date: DateTime.now, instrument: "violin" )

20.times { 
    f = Faker::Name.first_name
    l = Faker::Name.last_name
    full_name = f + " " + l
    p = Candidate.new(name: full_name, email: Faker::Internet.email(name: f), phone: Faker::PhoneNumber.phone_number)
    p.save
    p.audition = a
    p.save
}

rooms = ["Green Room", "255","256", "RR1"]

rooms.each_with_index do |r, i|
    room = Room.new(name: r, order: i)
    room.save
    room.audition = a
    room.save
end