shiro = Customer.create(username: "Shiro")
c1 = Customer.create(username: "Customer1")
c2 = Customer.create(username: "Customer2")
c3 = Customer.create(username: Faker::Name.name)
c4 = Customer.create(username: Faker::Name.name)

thai = Restaurant.create(name: "Thai")
greek = Restaurant.create(name: "Greek Place")
mcdonalds = Restaurant.create(name: "McDonalds")
r1 = Restaurant.create(name: Faker::Restaurant.name)
r2 = Restaurant.create(name: Faker::Restaurant.name)

padthai = MenuItem.create(food_name: "Pad Thai", price: 13.99)
padthai.restaurant = thai
padthai.save

salad = MenuItem.create(food_name: "Greek Salad", price: Faker::Number.decimal(l_digits: 2, r_digits: 2))
salad.restaurant = greek
salad.save

gyro = MenuItem.create(food_name: "Gyro", price: Faker::Number.decimal(l_digits: 2, r_digits: 2))
gyro.restaurant = greek
gyro.save

bigmac = MenuItem.create(food_name: "Big Mac", price: 3.99)
bigmac.restaurant = mcdonalds
bigmac.save

mi1 = MenuItem.create(food_name: Faker::Food.dish, price: Faker::Number.decimal(l_digits: 2, r_digits: 2))
mi1.restaurant = r1
mi1.save

def rest_meals(rest)
    meal = MenuItem.create(food_name: Faker::Food.dish, price: Faker::Number.decimal(l_digits: 2, r_digits: 2))
    meal.restaurant = rest
    meal.save
end

3.times {rest_meals(thai)}
3.times {rest_meals(greek)}
3.times {rest_meals(mcdonalds)}
3.times {rest_meals(r1)}
3.times {rest_meals(r2)}


def order_creation(customer, meal)
    order = Order.create
    order.customer = customer
    order.menu_item = meal
    order.save
end



order1 = Order.create
order1.customer = shiro
order1.menu_item = bigmac
order1.save

order2 = Order.create
order2.customer = c1
order2.menu_item = padthai
order2.save

order3 = Order.create
order3.customer = c2
order3.menu_item = salad
order3.save

order4 = Order.create
order4.customer = c3
order4.menu_item = mi1
order4.save

order5 = order_creation(c3, padthai)
order6 = order_creation(c4, salad)
order7 = order_creation(shiro, bigmac)