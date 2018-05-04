# Rails Engine - Endpoints

NOTES:

  * All endpoints are prefixed with `/api/v1`
  * All endpoints are accessed with the ```GET``` verb
  * All responses are formatted as ```JSON``` strings
  * No authentication query parameters or headers are required

## Table of Contents
[Merchant Endpoints](#merchant-endpoints)  
[Transaction Endpoints](#transaction-endpoints)  
[Customer Endpoints](#customer-endpoints)  



## Merchant Endpoints
```ruby
GET /merchants
```
Retrieves a list of all [merchants](#merchant-object).

```ruby
GET /merchants/:id
```
Retrieves a specific [merchant](#merchant-object) by ID.

```ruby
GET /merchants/find?_param=value_
```
Retrieves a specific merchant, by searching for any attribute of the [merchant object](#merchant-object).

```ruby
GET /merchants/find_all?_param=[value]_
```
Retrieves a list of merchants that match the specified search parameters ([merchant object attributes](#merchant-object)).

```ruby
GET /merchant/:id/revenue
```
Retrieves the revenue for a given merchant (accepts a _?date=[date string]_ query parameter to retrieve revenue for a given date.
`{"revenue": "5000.00"}`

```ruby
GET /merchants/:id/favorite_customer
```
Retrieves the [customer](#customer-object) who has made the most purchases from a given merchant.

```ruby
GET /merchants/most_items?quantity=_[number]_
```
Retrieves the given quantity merchant objects in descending order of number of items for sale.

```ruby
GET /merchants/:id/most_revenue?quantity=_[number]_
```
Retrieves the given quantity merchant objects in descending order of total revenue.

## Transaction Endpoints

```ruby
GET /transactions
```
Retrieves a list of all [transactions](#transaction-object).

```ruby
GET /transactions/:id
```
Retrieves a specific [transaction](#transaction-object) by ID.

```ruby
GET /transactions/find?_param=value_
```
Retrieves a specific transaction, by searching for any attribute of the [transaction object](#transaction-object).

```ruby
GET /transactions/find_all?_param=[value]_
```
Retrieves a list of transactions that match the specified search parameters ([transaction object attributes](#transaction-object)).

```ruby
GET /transactions/:id/invoice
```
Retrieves the [invoice](#invoice-object) for a given transaction.

## Customer Endpoints

```ruby
GET /customers
```
Retrieves a list of all [customers](#customer-object).

```ruby
GET /customers/:id
```
Retrieves a specific [customer](#customer-object).

```ruby
GET /customers/find?_param=value_
```
Retrieves a specific customer, by searching for any attribute of the [customer object](#customer-object).

```ruby
GET /customers/find_all?_param=[value]_
```
Retrieves a list of customers that match the specified search parameters ([customer object attributes](#customer-object)).

```ruby
GET /customers/:id/favorite_merchant
```
Retrieves the [merchant](#merchant-object) for which the customer has purchased from the most.

```ruby
GET /customers/:id/invoices
```
Retrieves all [invoices](#invoice-object) for a given customer.

```ruby
GET /customers/:id/transactions
```
Retrieves all [transactions](#transaction-object) for a given customer.

---
## Record Objects
---

### Merchant Object
```
  {
    id: 1,
    name: 'John Doe'
  }
```
### Customer Object
```
  {
    id: 1,
    first_name: 'John',
    last_name: 'Doe'
  }
```
### Transaction Object
```
  {
    id: 1,
    invoice_id: 1,
    credit_card_number: '1111-2222-3333-4444',
    result: 'success'
  }
```
### Invoice Object
```
  {
    id: 1,
    customer_id: 1,
    merchant_id: 1,
    status: 'shipped'
  }
```
