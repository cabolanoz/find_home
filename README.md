# Overview

find_home is a small project based on RoR framework that mocks a real estate application in which you can register properties with their corresponding title, type and description. It also keeps tracking of different features and photos of the properties.
The features might be composed by special characteristics of the property like; Pool, Terrace, among others.

# Requirements

* Ruby version
- ruby 2.3.1

* Rails version
- rails 5.0.0

# How to install

- Clone the project
- Setup database with `rails db:migrate`
- Install [ImageMagick](http://www.imagemagick.org/script/binary-releases.php) which gives the functionality for treating images
- Run `bundle install` for updating gems
- Run `rake db:seed` for populating `PropertyType` model
- Start local server with `puma` or `rails s`

# Caveats & disclaimers

- I would have used a SPA with ReactJS or some other framework for a better performance, but lacking of time
- I would have used a better searching engine like solr
