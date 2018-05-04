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
[Invoice Endpoints](#invoice-endpoints)  
[Item Endpoints](#item-endpoints)  
[InvoiceItem Endpoints](#invoiceitem-endpoints)  

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

## Invoice Endpoints

```ruby
GET /invoices
```
Retrieves a list of all [invoices](#invoice-object).

```ruby
GET /invoices/:id
```
Retrieves a specific [invoice](#invoice-object) by ID.

```ruby
GET /invoices/find?_param=value_
```
Retrieves a specific invoice, by searching for any attribute of the [invoice object](#invoice-object).

```ruby
GET /invoices/find_all?_param=[value]_
```
Retrieves a list of invoices that match the specified search parameters ([invoice object attributes](#invoice-object)).

```ruby
GET /invoices/:id/transactions
```
Retrieves a collection of associated transactions.

```ruby
GET /invoices/:id/invoice_items
```
Retrieves a collection of associated invoice items.

```ruby
GET /invoices/:id/items
```
Retrieves a collection of associated items.

```ruby
GET /invoices/:id/customer
```
Retrieves the associated customer.

```ruby
GET /invoices/:id/merchant
```
Retrieves the associated merchant.

## Item Endpoints

```ruby
GET /items
```
Retrieves a list of all [items](#item-object).

```ruby
GET /items/:id
```
Retrieves a specific [item](#item-object) by ID.

```ruby
GET /items/find?_param=value_
```
Retrieves a specific item, by searching for any attribute of the [item object](#item-object).

```ruby
GET /items/find_all?_param=[value]_
```
Retrieves a list of items that match the specified search parameters ([item object attributes](#item-object)).

```ruby
GET /items/:id/invoice_items
```
Retrieves a collection of associated invoice items.

```ruby
GET /items/:id/merchant
```
Retrieves the associated merchant.

```ruby
GET /items/most_revenue?quantity=x
```
Retrieves the top x items ranked by total revenue generated.

```ruby
GET /items/most_items?quantity=x
```
Retrieves the top x item instances ranked by total number sold.

```ruby
GET /items/:id/best_day
```
Retrieves the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

## InvoiceItem Endpoints

```ruby
GET /invoice_items
```
Retrieves a list of all [invoice items](#invoiceitem-object).

```ruby
GET /invoice_items/:id
```
Retrieves a specific [invoice item](#invoiceitem-object) by ID.

```ruby
GET /invoice_items/find?_param=value_
```
Retrieves a specific invoice item, by searching for any attribute of the [invoice item object](#invoiceitem-object).

```ruby
GET /invoice_items/find_all?_param=[value]_
```
Retrieves a list of invoice items that match the specified search parameters ([invoice item object attributes](#invoiceitem-object)).

```ruby
GET /invoice_items/:id/invoice
```
Retrieves the associated [invoice](#invoice-object) by ID.

```ruby
GET /invoice_items/:id/item
```
Retrieves the associated [item](#item-object) by ID.

## Record Objects

### Merchant Object
```ruby
  {
    id: 1,
    name: 'John Doe'
  }
```
### Customer Object
```ruby
  {
    id: 1,
    first_name: 'John',
    last_name: 'Doe'
  }
```
### Transaction Object
```ruby
  {
    id: 1,
    invoice_id: 1,
    credit_card_number: '1111-2222-3333-4444',
    result: 'success'
  }
```
### Invoice Object
```ruby
  {
    id: 1,
    customer_id: 1,
    merchant_id: 1,
    status: 'shipped'
  }
```
### Item Object
```ruby
  {
    id: 1,
    name: 'Sponge',
    description: 'Great to clean up stuff',
    unit_price: '10.05',
    merchant_id: 1
  }
```
### InvoiceItem Object
```ruby
  {
    id: 1,
    unit_price: '10.05',
    quantity: 5,
    invoice_id: 1,
    item_id: 520
  }
```
