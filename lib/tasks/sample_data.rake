amespace :db do
  desc "Fill database with sample data"
  task populate: :environment do


#  Create companies
	10.times do |n|
      	 name  = Faker::Company.name
	 email = Faker::Internet.email
         address="#{Faker::Address.street_name} | #{Faker::Address.city}"
	 phone=Faker::PhoneNumber.phone_number()
         Company.create!(name: name,
                     email: email,
                     address: address,
                     phone_number: phone)
    	end



#Creating Admin
    admin = User.new(name: "Example User",
                         email: "m@m.m",
                         password: "mmmmmm",
                         password_confirmation: "mmmmmm")
    admin.company_id=1 # company_id is not accessible so we have to use this way other wise mass assignment while creating is impossible
    admin.save
			 
   admin.toggle!(:admin)
#   Since Admin is not accessible we need to use toggle

    user=User.new(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
		# company_id is not accessible so we have to use this way other wise mass assignment while creating is impossible
		 user.company_id=2
		 user.save




#Create users and assign them to a company
	

    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      user=User.new(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)

      # company_id is not accessible so we have to use this way other wise mass assignment while creating is impossible
      user.company_id=Company.find(n+1).id
      user.save
    end

=begin    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
=end

    

#Create random Tender and populate the db
     40.times do |n|
      title  = "#{Faker::Company.bs()} tender "
      buyer_name = Faker::Company.name
      opening_date=Time.at(rand * Time.now.to_i)
      closing_date=Time.at(opening_date + ( 8*7*24*60*60)) #add 8 weeks to the deadline
      bid_amount= rand(10000...100000)
      description=Faker::Lorem.paragraph(sentence_count = 3)


      #Just to add different types of statuses     

      
	      
      
      tender=Tender.new(title: title,
                   buyer_name: buyer_name,
                   opening_date: opening_date,
                   closing_date: closing_date,
		   bid_amount: bid_amount    ,
		   bid_amount: bid_amount    ,
		   status: status,
		   description: description )

#      Just to add the 10 companies' to different tenders
            tender.company_id=Company.find((n/4)+1).id
	    tender.save

     end
    end   

  end
