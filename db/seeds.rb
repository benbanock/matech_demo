# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
# random images and status

@images  = ["image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg", "image5.jpg", "image6.jpg", "image7.jpg"]
@status = ["pending", "archived"]
@user = User.create({email: Faker::Internet.email, password: "azertyuiop", avatar: nil, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Name.title })
@avatar = ["avatar1.jpg", "avatar2.jpg", "avatar3.jpg"]
@canapes = ["206 8 CUBE", "503 SOFT PROPS", "551 SUPER BEAM SOFA SYSTEM", "552 FLOE INSEL", "720 LADY DIVANO", "514 REFOLO", "245 MEX CUBE", "276 ASPEN", "LC5"]
#créer users
#créer des tags


# Vrais seeds

item_attributes = [
  {
    attributes: {
      name: @canapes[0],
      photo: "https://cs1cdn.haworth.com/sites/cassina.com/files/styles/scheda_prodotto_top/public/03s_4.jpg?itok=xqsruMl8",
      url: "https://www.cassina.com/fr/collection/divani/206-8-cube"
    },
    tags: [@canapes[0], "canapé", "trois places","divani"]
  },
  {
    attributes: {
      name: @canapes[1],
      photo: "https://cs1cdn.haworth.com/sites/cassina.com/files/styles/scheda_prodotto_top/public/03_24.jpg?itok=sNKixihD",
      url: "https://www.cassina.com/fr/collection/divani/503-soft-props"
    },
    tags: [@canapes[1], "canapé", "quatre places", "divani"]
  },
  {
    attributes: {
      name: @canapes[2],
      photo: "https://cs3cdn.haworth.com/sites/cassina.com/files/styles/scheda_prodotto_top/public/03.jpg?itok=o2JiM_zg",
      url: "https://www.cassina.com/fr/collection/divani/551-super-beam-sofa-system"
    },
    tags: [@canapes[2],"canapé","trois places","divani"]
  },
  {
    attributes: {
      name: @canapes[3],
      photo: "https://cs3cdn.haworth.com/sites/cassina.com/files/styles/scheda_prodotto_top/public/02_31.jpg?itok=IJOnXQJ5",
      url: "https://www.cassina.com/fr/collection/divani/552-floe-insel"
    },
    tags: [@canapes[3],"canapé","trois places","divani"]
  },
  {
    attributes: {
      name: @canapes[4],
      photo: "https://cs3cdn.haworth.com/sites/cassina.com/files/styles/scheda_prodotto_top/public/lady_divanetto-2.jpg?itok=TAvVhLMS",
      url: "https://www.cassina.com/fr/node/3923"
    },
    tags: [@canapes[4], "canapé", "une place","node"]
  },
  {
    attributes: {
      name: @canapes[5],
      photo: "https://cs3cdn.haworth.com/sites/cassina.com/files/styles/scheda_prodotto_top/public/content/catalogo/514_refolo/immagini/ok/refolo_gallery03.jpg?itok=LWo62uEJ",
      url: "https://www.cassina.com/fr/collection/fauteuils-et-canapes/514-refolo"
    },
    tags: [@canapes[5],"canapé","deux places","refolo"]
  },
  {
    attributes: {
      name: @canapes[6],
      photo: "https://cs3cdn.haworth.com/sites/cassina.com/files/styles/scheda_prodotto_top/public/content/catalogo/276_aspen/immagini/ok/aspen_still_life_01.jpg?itok=XWzKrYyv",
      url: "https://www.cassina.com/fr/collection/fauteuils-et-canapes/276-aspen"
    },
    tags: [@canapes[6],"canapé","trois places","aspen"]
  },
  {
    attributes: {
      name: @canapes[7],
      photo: "https://cs1cdn.haworth.com/sites/cassina.com/files/styles/scheda_prodotto_top/public/content/catalogo/276_aspen/immagini/ok/aspen_still_life_03.jpg?itok=oSasoDaa",
      url: "https://www.cassina.com/fr/collection/fauteuils-et-canapes/276-aspen"
    },
  tags: [@canapes[7],"canapé", "trois places", "Le Corbusier"]
  }
]

user = @user
item_attributes.each do |item_info|
  item = Item.new(item_info[:attributes])
  item.remote_photo_url = item_info[:attributes][:photo]
  item.save
  item_info[:tags].each do |tag|
    item.tag_list.add(tag)
  end
  item.save
end

# generate 20 items

# 20.times do
#   Item.create({ name: Faker::Name.name, photo: @images[rand(7)], url: Faker::Internet.url })
# end

# generate 6 projects

6.times do
  Project.create({name: Faker::Name.name, date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) ,status: @status[rand(2)]})
end

# generate 4 users
4.times do
  User.create({email: Faker::Internet.email, password: "azertyuiop", avatar: nil, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Name.title })
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

