# RAILS ENGINE - Endpoints

NOTES:
  * All endpoints are prefixed with `/api/v1`
  * All endpoints are accessable with the **GET** verb
  * All responses are formatted as JSON strings
  * No authentication query parameters or headers are required

## Merchant Endpoints

#### *GET* /merchants
Retrieves a list of all [merchants](#merchant-object).

#### *GET* /merchants/:id
Retrieves a specific [merchant](#merchant-object) by ID.

#### *GET* /merchants/find?_param=value_
Retrieves a specific merchant, by searching for any attribute of the [merchant object](#merchant-object).

#### *GET* /merchants/find_all?_param=[value]_
Retrieves a list of merchants that match the specified search parameters ([merchant object attributes](#merchant-object)).

#### *GET* /merchant/:id/revenue
Retrieves the revenue for a given merchant (accepts a _?date=[date string]_ query parameter to retreive revenue on given date.
`{"revenue": "5000.00"}`

#### *GET* /merchants/:id/favorite_customer
Retrieves the [customer](#customer-object) who has made the most purchases from a given merchant.

#### *GET* /merchants/most_items?quantity=_[number]_
Retrieves the given quantity merchant objects in descending order of number of items for sale.

#### *GET* /merchants/:id/most_revenue?quantity=_[number]_
Retrieves the given quantity merchant objects in descending order of total revenue.
µ
## Transaction Endpoints

#### *GET* /transactions
Retrieves a list of all [transactions](#transaction-object).

#### *GET* /transactions/:id
Retrieves a specific [transaction](#transaction-object) by ID.

#### *GET* /transactions/find?_param=value_
Retrieves a specific transaction, by searching for any attribute of the [transaction object](#transaction-object).

#### *GET* /transactions/find_all?_param=[value]_
Retrieves a list of transactions that match the specified search parameters ([transaction object attributes](#transaction-object)).

#### *GET* /transactions/:id/invoice
Retrieves the [invoice](#invoice-object) for a given transaction.

## Customer Endpoints

#### *GET* /customers
Retrieves a list of all [customers](#customer-object).

#### *GET* /customers/:id
Retrieves a specific [customer](#customer-object).

#### *GET* /customers/find?_param=value_
Retrieves a specific customer, by searching for any attribute of the [customer object](#customer-object).

#### *GET* /customers/find_all?_param=[value]_
Retrieves a list of customers that match the specified search parameters ([customer object attributes](#customer-object)).

#### *GET* /customers/:id/favorite_merchant
Retrieves the [merchant](#merchant-object) for which the customer has purchased from the most.

#### *GET* /customers/:id/invoices
Retrieves all [invoices](#invoice-object) for a given customer.

#### *GET* /customers/:id/transactions
Retrieves all [transactions](#transaction-object) for a given customer.

---
## Record Objects

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
