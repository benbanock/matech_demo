# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# random images and status

@images  = ["image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg", "image5.jpg", "image6.jpg", "image7.jpg"]
@status = ["pending", "archived"]
@avatar = ["avatar1.jpg", "avatar2.jpg", "avatar3.jpg"]

# generate 20 items

20.times do
  Item.create({ name: Faker::Name.name, photo: @images[rand(7)], url: Faker::Internet.url })
end

# generate 6 projects

6.times do
  Project.create({name: Faker::Name.name, date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) ,status: @status[rand(2)]})
end

# generate 20 tags

6.times do
  Project.create({name: Faker::Name.name, date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) ,status: @status[rand(2)]})
end

# generate 4 users
4.times do
  User.create({email: Faker::Internet.email, password: "azertyuiop", avatar: @avatar[rand(3)], first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Name.title })
end
# generate 4 UserProjects
# for user1
UserProject.create({user_id: 1, project_id: 1})
UserProject.create({user_id: 1, project_id: 2})
UserProject.create({user_id: 1, project_id: 3})
UserProject.create({user_id: 1, project_id: 4})
UserProject.create({user_id: 1, project_id: 5})

# for user2

UserProject.create({user_id: 2, project_id: 1})
UserProject.create({user_id: 2, project_id: 2})
UserProject.create({user_id: 2, project_id: 4})
UserProject.create({user_id: 2, project_id: 5})
UserProject.create({user_id: 2, project_id: 6})

#for user3

UserProject.create({user_id: 3, project_id: 1})
UserProject.create({user_id: 3, project_id: 2})
UserProject.create({user_id: 3, project_id: 3})
UserProject.create({user_id: 3, project_id: 6})
UserProject.create({user_id: 3, project_id: 5})

# generate ProjectItems

# for project1
ProjectItem.create({project_id: 1, item_id: 1})
ProjectItem.create({project_id: 1, item_id: 2})
ProjectItem.create({project_id: 1, item_id: 3})
ProjectItem.create({project_id: 1, item_id: 4})
ProjectItem.create({project_id: 1, item_id: 5})
ProjectItem.create({project_id: 1, item_id: 6})
ProjectItem.create({project_id: 1, item_id: 7})
ProjectItem.create({project_id: 1, item_id: 8})
ProjectItem.create({project_id: 1, item_id: 9})
ProjectItem.create({project_id: 1, item_id: 10})
ProjectItem.create({project_id: 1, item_id: 11})
ProjectItem.create({project_id: 1, item_id: 12})
ProjectItem.create({project_id: 1, item_id: 13})
ProjectItem.create({project_id: 1, item_id: 14})
ProjectItem.create({project_id: 1, item_id: 15})
ProjectItem.create({project_id: 1, item_id: 16})
ProjectItem.create({project_id: 1, item_id: 17})
ProjectItem.create({project_id: 1, item_id: 18})
ProjectItem.create({project_id: 1, item_id: 19})
ProjectItem.create({project_id: 1, item_id: 20})

# for project2

ProjectItem.create({project_id: 2, item_id: 1})
ProjectItem.create({project_id: 2, item_id: 2})
ProjectItem.create({project_id: 2, item_id: 4})
ProjectItem.create({project_id: 2, item_id: 5})
ProjectItem.create({project_id: 2, item_id: 6})

#for project3

ProjectItem.create({project_id: 3, item_id: 1})
ProjectItem.create({project_id: 3, item_id: 2})
ProjectItem.create({project_id: 3, item_id: 3})
ProjectItem.create({project_id: 3, item_id: 5})
ProjectItem.create({project_id: 3, item_id: 6})


p "done"

