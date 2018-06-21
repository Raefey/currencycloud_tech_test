# CurrencyCloud Coolpay API tech test

### Brief

Coolpay is a new company that allows to easily send money to friends through their API.

You work for Fakebook, a successful social network. You’ve been tasked to integrate Coolpay inside Fakebook. A/B tests show that users prefer to receive money than pokes!

You can find Coolpay documentation here: http://docs.coolpayapi.apiary.io/

You will write a small app that uses Coolplay API in Ruby. The app should be able do the following:

### Build status

[![Maintainability](https://api.codeclimate.com/v1/badges/dcca0f8e11e2c566a12b/maintainability)](https://codeclimate.com/github/Raefey/currencycloud_tech_test/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/dcca0f8e11e2c566a12b/test_coverage)](https://codeclimate.com/github/Raefey/currencycloud_tech_test/test_coverage)

### Tech stack used
Text editor - [Atom](https://atom.io/)

Testing framework - [Rspec](http://rspec.info/)

Continuous integration service - [Travis CI](https://travis-ci.org/)

Code quality - [Code Climate](https://codeclimate.com/)

Web Framework - [Sinatra](http://sinatrarb.com/)
### User stories

```
As a User
I want to be able to Authenticate to Coolpay API
So other people cannot send my money

As a User
I want to be able to Add recipients
So I can list my friends easily

As a User
I want to be able to Send Money
So I can save time by not using my bank

As a User
I want to be send a confirmation message when a payment is successful
So that I'm not worrying about losing money
```

### Challenges
I'll outline the two most notable challenges.

1. I didn't want to post my login details for the API to Github, so no problem; I just saved them as environmental variables in my env.yml and added it to a `.gitignore` file. Problem solved. However when I came to use Travis for continuous integration, it failed every Rspec test as it was not able to log into the API. I found a handy tool in Travis; which allows  you to encrypt a file. Then before Travis runs it's script you tell it to decrypt the file with a unique key, meaning it gains access to the environmental variables. It even saves the decrypted file under a name of your choosing. Meaning there are no problems with access to the env.yml file.

2. When posting the payments, I would use the response from the API and access the values from each payment hash, using the relevant keys. I would iterate through the array of payments, posting information I thought would be useful to display, such as: Amount, Currency and Status. However I thought knowing who you had paid would be useful, this information was not in the API response. The recipient ID was in the response, however it is unreasonable for you to assume your users will know all their friends unique user IDs. So the solution is simple; search for user by ID and then print the name paired to it, except there is no API request to search by user ID. So I made my own method in the *RecipientList* class to search for a user by ID, which would return the name of that user. I used this method in my *PaymentList class*, by extracting the user ID of a payment, searching the recipient list for that ID and then adding a new key value pair to that payment with the name of the user; allowing me to print the name next to the payment. The classes became slightly too involved with each other for my liking, however it was a feature I strongly believed should be added, and was unable to do it using just the API response.

### Views

![Index](./pictures/index_view.png)

![Payments](./pictures/payments_view.png)
