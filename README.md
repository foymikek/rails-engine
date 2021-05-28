# README

# Rails Engine

### About this App

This API allows the user to query e-commerce endpoints to retrieve information related to Merchants, Items, and Sales.

## Versions

- Ruby 2.5.3

- Rails 5.2.4.3



<!-- ABOUT THE PROJECT -->
## About The Application

Endpoints and example queries are listed below.

Merchants:
Example JSON response for the Merchant resource:
```
{
  "data": [
    {
      "id": "1",
        "type": "merchant",
        "attributes": {
          "name": "Mike's Awesome Store",
        }
    },
{
```
- get all merchants, allows for pagination
```
GET /api/v1/merchants?per_page=50&page=2
```
- get one merchant
```
GET /api/v1/merchant/:id
```
- get all items for a given merchant ID
```
GET /api/v1/merchants/:id/items 
```


Items:
Example of JSON response for Item resource.
```
{
  "data": {
    "id": "1",
    "type": "item",
    "attributes": {
      "name": "Super Widget",
      "description": "A most excellent widget of the finest crafting",
      "unit_price": 109.99
    }
  }
}
```
- get all items, allows for pagination
```
GET /api/v1/items?per_page=50&page=2
```
- get one item
```
GET /api/v1/item/:id
```
- create an item
```
POST /api/v1/items
```
- edit an item
```
PUT /api/v1/items/:id
```
- delete an item
```
POST /api/v1/items
```
- get the merchant data for a given item ID
```
GET /api/v1/items/:id/merchant
```

NonCrud Endpoints
- Find merchant based on partial search
```
GET /api/v1/merchants/find
```
- Find all Items based on partial search
```
GET /api/v1/items/find_all
```

Example of JSON response for revenue
```
{
    "data": {
        "id": "42",
        "type": "merchant_revenue",
        "attributes": {
            "revenue": 532613.98
        }
    }
}
```

- Find top merchants by revenue
```
GET /api/v1/revenue/merchants
```
- Find total revenue for a given merchant
```
GET /api/v1/revenue/merchants/:id
```

Example of JSON response for potential revenue
```
{
    "data": [
        {
            "id": "4844",
            "type": "unshipped",
            "attributes": {
                "potential_revenue": 1504.08
            }
        }
    ]
}
```

- find potential(unshipped) revenue by largest invoice
```
GET /api/v1/revenue/unshipped
```
- find merhants with higest revenue
```
GET /api/v1/revenue/merchants
```

### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [RSpec](https://github.com/rspec/rspec-rails)
* [JSONAPI](https://github.com/jsonapi-serializer/jsonapi-serializer)



<!-- GETTING STARTED -->
## Getting Started

### Installation

2. Fork and Clone the repo
   ```
   git clone [https://github.com/foymikek/rails-engine]
   ```
3. Install gems
   ```
   bundle install
   ```
4. Setup the database: 
   
   The database is set up with a .pgdump. 
   [https://backend.turing.edu/module3/projects/rails_engine/RailsEngineSection1.postman_collection.json]
   [https://backend.turing.edu/module3/projects/rails_engine/RailsEngineSection2.postman_collection.json]
   [https://backend.turing.edu/module3/projects/rails_engine/RailsEngineSection3.postman_collection.json]
   ```
   Run rake db:{drop,create,migrate,seed} 
   ```


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.




<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Img Shields](https://shields.io)
* [MIT Open Source License](https://opensource.org/licenses/MIT)
* [GitHub Pages](https://pages.github.com)



