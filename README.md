# README

# Overview
1. App brief for MarketPlace
2. App Requirements
3. Wireframing
4. User Stories
5. Entity Relationship Diagram
6. Configuration, Database Creation & Database Initalisation
7. Gems
8. Ruby Version
9. Rails Version

---
## 1. App brief for MarketPlace
Creating a website to promote your brand and sell your products can be difficult without any coding experience. There are many options for a business to sell their products however they can be costly and hard to set up. MarketPlace focuses on user experience and affordability to provide an online market place for a business to sell their products and promote their brand. MarketPlace provides a simple user interface where a website is created once  user signs up, and to start selling all the user is required to do is simply click a button and follow some simple steps to create a payment account through stripe to start earning money. MarketPlace not only focuses on the user experience for a seller but also a buyer, by not requiring to create an account to buy product and also having the ability to purchase products from multiple shop in one transaction MarketPlace creates a desirable user experience for all parties involved.

Link : [https://digitalmarketplace.herokuapp.com/](https://digitalmarketplace.herokuapp.com/)

---
## 2. App Requirements

1. Create your application using Ruby on Rails.
2. Demonstrate knowledge of Rails conventions.
3. Use postgresql database in development.
4. Use an API (eg. Omniauth, Geocoding, Maps, other..).
5. Use appropriate gems.
6. Use environmental variables to protect API keys etc. (dotenv)
7. Implement a payment system for your product. (e.g. Stripe)
8. Your app must send transactional emails (eg. using Mailgun).
9. Your app should have an internal user messaging system.
10. Your app will have some type of searching, sorting and/or filtering capability.
11. Your app will have some type of file uploading capability (eg. images).
12. Your app will have authentication (eg. Devise, must have full functionality in place).
13. Your app will have authorisation (users have restrictions on what they can see and edit).
14. Your app may have an admin dashboard for the admin user to administrate the site.
15. Document your application with a README that explains how to setup, configure and use your application. 


---
## 3. Wireframing
![wireframe](public/readme_images/wireframe.png?raw=true)

---
## 4. User Stories
![wireframe](public/readme_images/userstories.png?raw=true)
Link: [https://trello.com/b/6RHt5sse/marketplace/](https://trello.com/b/6RHt5sse/marketplace) 

---
## 5. Entity relationship diagram / DB Schema
![ERD](public/readme_images/erd.png?raw=true)

---
## 6. Configuration, Database Creation & Database Initalisation
1. Clone repo
2. Run bundle install
3. Create .env file in the root dir with the following config variables
  - POSTGRES_PASSWORD // postgreSQL
  - PUBLISHABLE_KEY // stripe
  - SECRET_KEY // stripe
  - AWS_ACCESS_KEY_ID // amazon
  - AWS_REGION // amazon
  - AWS_SECRET_ACCESS_KEY // amazon
  - S3_BUCKET_NAME // amazon s3
  - SECRET_KEY_BASE // stripe
  - MAILGUN_API_KEY // mailgun
  - MAILGUN_DOMAIN // mailgun
  - MY_EMAIL // administrator email - must validate in mailgun dashboard
4. Run rails db:create
5. Run rails db:migrate
6. Run rails server
7. Create first user (sign up form)
8. Run rails console
9. Give first user admin role
  - user = User.find(1)
  - user.add_role :admin (to assign admin role)
  - user.save (to save role)
  - user.has_role? :admin (should now return => true)
10. Create categories
  - Category.create( name: "category" )
  - Repeat process until you are happy with categroies
11. Run rails server 
12. Create next user (sign up form)
13. Background image can be changed form preset image via drag and drop
14. Logo can be changed from preset via drag and drop
15. To access admin area add /orders to the end of your localhost address


---
## 7. Gems
1. gem 'pg' 
  - Link: [https://github.com/ged/ruby-pg](https://github.com/ged/ruby-pg)
2. gem 'devise'
  - [https://github.com/plataformatec/devise](https://github.com/plataformatec/devise)
3. gem 'carrierwave', '~> 1.0'
  - [https://github.com/carrierwaveuploader/carrierwave](https://github.com/carrierwaveuploader/carrierwave)
4. gem 'stripe'
  - [https://github.com/stripe/stripe-ruby](https://github.com/stripe/stripe-ruby)
5. gem 'dotenv-rails', groups: [:development, :test]
  - [https://github.com/bkeepers/dotenv](https://github.com/bkeepers/dotenv)
6. gem 'carrierwave-aws'
  - [https://github.com/sorentwo/carrierwave-aws](https://github.com/sorentwo/carrierwave-aws)
7. gem 'httparty'
  - [https://github.com/jnunemaker/httparty](https://github.com/jnunemaker/httparty)
8. gem 'mailgun-ruby', '~>1.1.6'
  - [https://github.com/mailgun/mailgun-ruby](https://github.com/mailgun/mailgun-ruby)
9. gem 'rolify'
  - [https://github.com/RolifyCommunity/rolify](https://github.com/RolifyCommunity/rolify)

---
## 8. Ruby Version
ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]

---
## 9. Rails Version
Rails 5.1.4

---
