# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
JoinTableSpecialtyDoctor.destroy_all


5.times do 
	city = City.create!(
		city_name: Faker::Address.city 
		)
end 

5.times do 
	patient = Patient.create!(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name,
		city_id: rand(City.first.id..City.last.id)
		)
end 

5.times do 
	doctor = Doctor.create!(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name, 
		zip_code: Faker::Address.zip_code,
		city_id: rand(City.first.id..City.last.id)
		)
end 

5.times do 
	specialty = Specialty.create!(
		specialty_name: Faker::Job.field 
		)
end 

5.times do 
	table_join_doctor_specialties = JoinTableSpecialtyDoctor.create!(
		specialty_id: rand(Specialty.first.id..Specialty.last.id), 
		doctor_id: rand(Doctor.first.id..Doctor.last.id)
		)
end 

5.times do 
	appointment = Appointment.create!(
		patient_id: rand(Patient.first.id..Patient.last.id), 
		doctor_id: rand(Doctor.first.id..Doctor.last.id),
		city_id: rand(City.first.id..City.last.id)
		)
end 

puts "Fake data initialized"