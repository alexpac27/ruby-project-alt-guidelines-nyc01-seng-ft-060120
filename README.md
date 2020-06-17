Module One Final Project: Flatiron Food Ordering App
By: Shiro Han, Alex Ortiz
========================

Welcome to the Flatiron Food Order App! This is a food ordering app, similar to Grubhub and Seamless, that will allow you to place food orders from your favorite restaurants. The app allows you to register as a new user or log in to an existing account. Once in your account, you can do any of the following:

    * Create a new order
    * View latest order
    * Update last order
    * Cancel last order
    * View order history
    * Update username
    * Exit the app

### Installation

Before you can run the app, please follow the installation steps below:

  * Run 'bundle install' to ensure that you have all of the necessary gems.
  * Run 'rake db:migrate' to migrate all of the necessary tables.
  * Run 'rake db:seed' to activate the data for the app.
  * Finally, to run the app, type 'ruby ./bin/run.rb' in your terminal.


### Presentation Notes

During the creation of our project, common hurdles included:

    * Ensuring that our code was abstract enouch to avoid confusion.
    * Making sure that whenever we made changes to a record in the database, that we were using the appropriate AR commands to save the data.
    * Identifying opportunities for recursion and properly updating the code to fit the recursion choices.

Additional changes we would like to make to the app include:

    * Further abstraction
    * Adding a Driver model and expanding on our Restaurant user stories
    * Implementing APIs for seed data (in moderation)
    * Adding functionality of tty prompt to make the UX more streamlined


Highlights include:
    
    * Login method and register method
            - the use of recursion to ensure correct registration and proper access to database records
    * Dealing with errors from the user input
            - using .titleize to eliminate errors between the database and user input
            - using recursion and clear messages to guide the user down a correct path



