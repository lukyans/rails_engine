# README

# Rails Engine

## Introduction:

Rails Engine emphasizes designing and building an API with consistent and coherent response structures, as well as serializers to format JSON data. This project makes use of ActiveRecord relationships and queries, including some advanced query functionality such as multiple joins operations and named scopes within merge methods on a joined model.

Project Spec: [here](http://backend.turing.io/module3/projects/rails_engine)

### Collaborators

-Sergey Lukyanenko & Craig Ness
Link to Project Repo:  [github](https://github.com/lukyans/rails_engine)


## Get Started with Rails Engine:

Clone this repo:
```
git clone git@github.com:lukyans/rails_engine.git
```

Navigate into the project and bundle:
```
cd rails_engine
bundle
```

Create, migrate, and seed the database:
```
rake db:create
rake db:migrate
rake import
```

## Endpoints
In the terminal, start the server: `rails s`

### Record Endpoints

Navigate to these urls starting with `localhost:3000`
#### Merchants
/api/v1/merchants
/api/v1/merchants/:id
/api/v1/merchants/random

#### Customers
/api/v1/customers
/api/v1/customers/:id
/api/v1/customers/random

#### Items
/api/v1/items
/api/v1/items/:id
/api/v1/items/random

#### Invoices
/api/v1/invoices
/api/v1/invoices/:id
/api/v1/invoices/random

#### Invoice_Items
/api/v1/invoice_items
/api/v1/invoice_items/:id
/api/v1/invoice_items/random

#### Transactions
/api/v1/transactions
/api/v1/transactions/:id
/api/v1/transactions/random

### Relationship Endpoints

Navigate to these urls starting with `localhost:3000`
#### Merchants

/api/v1/merchants/:id/items
/api/v1/merchants/:id/invoices

#### Invoices

/api/v1/invoices/:id/transactions
/api/v1/invoices/:id/invoice_items
/api/v1/invoices/:id/items
/api/v1/invoices/:id/customer
/api/v1/invoices/:id/merchant

#### Invoice Items

/api/v1/invoice_items/:id/invoice
/api/v1/invoice_items/:id/item

#### Items

/api/v1/items/:id/invoice_items
/api/v1/items/:id/merchant

#### Transactions

/api/v1/transactions/:id/invoice

#### Customers

/api/v1/customers/:id/invoices
/api/v1/customers/:id/transactions

### Business Intelligence Endpoints

Navigate to these urls starting with `localhost:3000`
#### Merchants

/api/v1/merchants/most_revenue?quantity=x
/api/v1/merchants/most_items?quantity=x
/api/v1/merchants/revenue?date=x
/api/v1/merchants/:id/revenue
/api/v1/merchants/:id/revenue?date=x
/api/v1/merchants/:id/favorite_customer

#### Items

/api/v1/items/most_revenue?quantity=x
/api/v1/items/most_items?quantity=x
/api/v1/items/:id/best_day

#### Customers

/api/v1/customers/:id/favorite_merchant

##Enjoy!
