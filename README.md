<a name="readme-top"></a>
# Jungle

<div align="center">
  <a  href = 'https://github.com/danekf/Ruby-Jungle'>
    <img src = images/home.png width = 70%> </a>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#Setup">Setup</a></li>
    <li><a href="#Database">Database</a></li>
    <li><a href="#Stripe-Testing">Stripe Testing</a></li>
    <li><a href="#Dependencies">Dependencies</a></li>
    <li><a href="#Using-Jungle">Using Jungle</a></li>
      <ul>
        <li><a href="#Client-Example">Client Example</a></li>
        <li><a href="#Admin-Example">Admin Example</a></li>
      </ul>
  </ol>
</details>
<br>

# About the project
A mini e-commerce application built with Rails 6.1 for purposes of learning rails. Implements secure user registration and login. Admin pages locked behind simple authentication allow admin to add products or categories.

Project uses stripe integration to process payments from the cart and then presents the user with an itemized list of their order.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<br>

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `npm run start-jungle` to start the server

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<br>

## Database

If Rails is give you an error about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<br>

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 when testing checkout. This is a dummy credit card that will automatically be accepted and logged to your stripe dashboard.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- Cypress 9.7.0
- Webpack-dev-server

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<br>

# Using Jungle
The following examples will show useage of the jungle project from the client perspective as well as admin specific tools.

## Client Example
When a client first loads the page, they are presented with a homepage that lists the latest products, as well as a description of what jungle is all about.

<div align = "center">
  <img src = images/home-products.png width = 90%> </a>
</div>
The top bar shows all categories of plants. Including a mock "Pizza" plant category created by a creative admin. It also will show whether the client is currently logged in, an admin dropdown menu and access to a cart.

It also lists the latest products from the database.

When a client clicks on a category of product, a page is loaded and is populated with a list of all plants for that category. For example, this is what a user will see when they click on "Shrubs" in the top bar.

<div align = "center">
  <img src = images/product-category.png width = 90%> </a>
</div>

This would be the page if a user chooses to explore the rare "Pizza" plant category, as another example.

<div align = "center">
  <img src = images/product-pizza.png width = 90%> </a>
</div>

We can see that only a single plant is loaded in this case.

<br>
A user can also click on any product card to load a page with details of that plant.

<div align = "center">
  <img src = images/product-details.png width = 90%> </a>
</div>

When a user clicks on ADD on any product card, the product is added to their cart.

<div align = "center">
  <img src = images/cart.png width = 90%> </a>
</div>

We can see that the cart has changed to now show that there is (1) item in the cart.

A user is then able to checkout. Clicking on the "Pay with card" button will allow a user to pay with their credit card using stripe. A developper will then use the provided stripe test card number to process the payment.

<div align = "center">
  <img src = images/checkout.gif width = 90%> </a>
</div>

The user is then presented with an itemized order confirmation.
<div align = "center">
  <img src = images/order-complete.png width = 90%> </a>
</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<br>

## Admin Example
There is also an admin control panel that allows basic overview of all categories, number of products, etc. It also allows an admin to manage products, create new products and categories.

When a new category is created, a link in the top nav bar is automatically created.

When clicking on the admin secition, Jungle will ask for the admin User and password. Once logged in sucessfully, the admin can browse any admin page and make changes.

<div align = "center">
  <img src = images/admin-login.gif width = 90%> </a>
</div>

For example, an admin can click on the +New product button on the all products page. Here they are able to add a new product and select from a dropdown menu for which category it belongs in.

<div align = "center">
  <img src = images/admin-newProduct.png width = 90%> </a>
</div>

The admin can do the same for a new category, such as the delightful and ficticious Pizza category.