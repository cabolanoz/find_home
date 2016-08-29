# Overview

find_home is a small project based on RoR framework that mocks a real estate application in which you can register properties with their corresponding title, type and description. It also keeps tracking of different features and photos of the properties.
The features might be composed by special characteristics of the property like; Pool, Terrace, among others.

# Requirements

* Ruby version
`ruby 2.3.1`

* Rails version
`rails 5.0.0`

* Database
`postgres 9.4+`

# How to install

- Clone the project
- Setup database with `rails db:migrate`
- Install [ImageMagick](http://www.imagemagick.org/script/binary-releases.php) which gives the functionality for treating images
- Run `bundle install` for updating gems
- Run `rake db:seed` for populating `PropertyType` model
- Start local server with `puma` or `rails s`

# Caveats & disclaimers

- Frontend architecture; This project uses heavily simple embedded Ruby (ERB) template system which is not bad in itself, but put in place an SPA architecture with ReactJS could provide more front end capabilities.

- Search Engine; The current approach is a simple like sql operator with no real usage of fulltext search given the time restriction seems to be the easiest and fastest albeit not the right one. There is a lot of room for improvement here to apply postgres fulltext search or a Solr instance with sunspot.

- Testing; The project relies on (rspec + factory_girl + faker) as the bases for unit testing, depending on how fast the project grows using cucumber or mocha should be considered.

# Additional considerations

If any additional configuration to the database has to be made, please feel free to edit the `app/config/database.yml` file
