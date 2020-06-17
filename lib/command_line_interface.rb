require 'pry'
class CommandLineInterface

    def greet
        prompt = TTY::Prompt.new
        customer = nil
        sleep 2
        system "clear"
        puts "Welcome to the Flatiron Food Ordering App."
        puts ""
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Register", -> {self.register}
            menu.choice "Login", -> {self.login}
            menu.choice "Exit App", -> {self.exit_app}
        end
    end

    def register
        prompt = TTY::Prompt.new
        puts "___________________________"
        puts ""
        puts ""
        inputUser = prompt.ask("Register by providing a username:").titleize
        puts ""
        puts ""
        inputPass = prompt.mask("Please provide a password:")
        Customer.create(username: inputUser, password: inputPass)
        puts ""
        puts "Thank you for registering, #{inputUser}. You are now able to login from the homepage."
        puts ""
        puts "Redirecting you to the homepage now..."
        puts ""
        sleep 5
        self.greet
    end

    def login
        prompt = TTY::Prompt.new
        puts "___________________________"
        puts ""
        puts ""
        inputUser = prompt.ask("Enter your username:").titleize
        
        if !!Customer.find_by(username: inputUser)
            puts ""
            puts ""
            inputPass = prompt.mask("Enter your password:")
            if !!Customer.find_by(username: inputUser, password: inputPass)
                customer = Customer.find_by(username: inputUser, password: inputPass)
                
                self.next_choice(customer)
            else 
                puts "Incorrect Password. Please try again."
                self.greet
                puts ""
            end
        else
            puts "Can not find a user with that username."
            self.greet
            puts ""
        end

    end

    def restaurant_list
        prompt = TTY::Prompt.new
        puts "Here is a list of all restaurants:"
        puts ""
        allrestaurant = Restaurant.all.map {|rest| rest.name}
        check = prompt.enum_select("Select restaurant to view menu", allrestaurant, per_page: 10)
        read_menu(check)
    end

    def read_menu(restaurant_name)
        selected_rest = Restaurant.find_by(name: restaurant_name)
        puts selected_rest.return_menu_string
    end

    def food_selection_checker
        puts ""
        puts "___________________________"
        puts "Please select your item by typing the food name:"
        puts ""
        food_input = gets.strip.titleize

        if !!MenuItem.find_by(food_name: food_input)
            MenuItem.find_by(food_name: food_input)
        else
            puts ""
            puts "*** You seem to have a typo. Please try again. ***"
            food_selection_checker
        end
    end

    def place_new_order(customer)
        food_selection = food_selection_checker
        customer.place_order(food_selection)
        puts ""
        puts "You have selected #{food_selection.food_name}."
        puts "Your order has been created!"
        puts "Your total is $#{food_selection.price}."
    end

    def additional_order(customer)
        self.restaurant_list
        self.place_new_order(customer)
        sleep 5
        self.next_choice(customer)
    end

    def next_choice(customer)
        prompt = TTY::Prompt.new
        sleep 2
        system "clear"
        puts ""
        prompt.select("Welcome, #{customer.username}. What would you like to do next?", per_page:7) do |menu|
            menu.choice "Create New Order", -> {self.additional_order(customer)}
            menu.choice "View Last Order", -> {self.view_last_order(customer)}
            menu.choice "Update Last Order", -> {self.update_last_order(customer)}
            menu.choice "Cancel Last Order", -> {self.cancel_order(customer)}
            menu.choice "View Order History", -> {self.view_order_history(customer)}
            menu.choice "Update Username", -> {self.change_username(customer)}
            menu.choice "Exit App", -> {self.exit_app}
         end
    end

    def view_order_history(customer)
        puts "#{customer.username}'s Order History:"
        puts ""
        customer.orders.each {|order| puts "#{order.menu_item.food_name} ---> $#{order.menu_item.price}"}
        totalspent = customer.orders.map {|order| order.menu_item.price}.sum
        puts ""
        puts "You've spent a total of $#{totalspent} with us!"
        sleep 3
        self.next_choice(customer)
    end

    def update_last_order(customer)
        menu_obj = customer.last_order.menu_item
        puts "You will be updating the following order: "
        puts ""
        puts "#{menu_obj.food_name} ---> $#{menu_obj.price}"
        puts ""
        sleep 3
        puts "___________________________"
        self.restaurant_list
        food_selection = food_selection_checker
        customer.update_last_order(food_selection)
        puts ""
        puts "Update Succesful!"
        puts ""
        self.view_last_order(customer)
    end

    def view_last_order(customer)
        puts "Your latest order is below:"
        puts ""
        menu_obj = customer.last_order.menu_item
        puts "#{menu_obj.food_name} ---> $#{menu_obj.price}"
        sleep 3
        self.next_choice(customer)
    end

    def change_username(customer)
        prompt = TTY::Prompt.new
        puts ""
        new_un = prompt.ask("What would you like to change your Username to?").titleize
        customer.change_username(new_un)
        puts ""
        puts "You've changed your Username to #{customer.username}!"
        puts "___________________________"
        sleep 3
        self.next_choice(customer)
    end

    def cancel_order(customer)
        customer.cancel_last_order
        puts ""
        puts "You successfully cancelled your last order."
        sleep 3
        self.next_choice(customer)
    end

    def exit_app
        puts "Goodbye!"
        sleep 3
        system "clear"
    end

    def run
        self.greet
    end
end