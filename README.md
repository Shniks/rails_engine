# Rails Engine

The Rails Engine is an API server to interact with and retrieve data for an online merchant shop. The data includes information about items, merchants, customers, and transactions/ invoices.

The endpoints for interacting with the API are located [here](./readme/endpoints.md).

The application is also hosted on [Heroku](http://rails-engine-1801.herokuapp.com/api/v1/merchants).

## Table of Contents
[Prerequisites](#prerequisites)  
[Installation Instructions](#installation-instructions)  
[Database Schema](#database-schema)  
[Testing](#testing)  
[Authors](#authors)

### Prerequisites

```
Ruby Version 2.4 or higher
Rails Version 5 or higher
Postgresql
```

### Installation Instructions

Clone this repository into your machine using the following command:
```ruby
git clone git@github.com:kolyaventuri/rails_engine.git
```

Switch into the directory ```rails_engine``` and run bundle as follows:
```ruby
bundle
```

Setup the database by running the following commands:
```ruby
rake db:{create, migrate}
rake import:all
```

To view the app on localhost, start the server by entering the following command in your terminal:
```ruby
rails s
```

Open up a browser window and then visit any of the specified [endpoints](./readme/endpoints.md).

### Database schema  

The relationships between the various database tables are outlined below:

![schema](./readme/schema.png)

### Testing

This app has a 100% test coverage (as determined by [SimpleCov](https://github.com/colszowka/simplecov)) using the [RSpec](https://github.com/rspec/rspec-rails) testing framework. The app utilizes various gems including [Factory Bot](https://github.com/thoughtbot/factory_bot), [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner) and [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers).

Testing can be initiated by entering the following command in your terminal:
```ruby
Rspec
```

### Authors

[Kolya Venturi](https://github.com/kolyaventuri)  
[Nikhil Shahi](https://github.com/Shniks)
