namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    admin = User.create!(name: "Example User",
                         email: "m@m.m",
                         password: "mmmmmm",
                         password_confirmation: "mmmmmm")
    admin.toggle!(:admin)
 
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end

#Create random Tender and populate the db
     20.times do |n|
      title  = "#{Faker::Company.bs()} tender "
      company_name = Faker::Company.name
      opening_date=Time.at(rand * Time.now.to_i)
      closing_date=Time.at(opening_date + ( 8*7*24*60*60)) #add 8 weeks to the deadline
      bid_amount= rand(10000..100000)
      description=Faker::Lorem.paragraph(sentence_count = 3)
	      
      
      Tender.create!(title: title,
                   company_name: company_name,
                   opening_date: opening_date,
                   closing_date: closing_date,
		   bid_amount: bid_amount    ,
		   bid_amount: bid_amount    ,
		   description: description )
    end
    

  end
end
    
