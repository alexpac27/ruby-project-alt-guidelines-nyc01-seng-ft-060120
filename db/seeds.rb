shiro = Customer.create(username: "Shiro", password: 123)
c1 = Customer.create(username: "Customer1", password: 123)
c2 = Customer.create(username: "Customer2", password: 123)
c3 = Customer.create(username: Faker::Name.first_name, password: 123)
c4 = Customer.create(username: Faker::Name.first_name, password: 123)

thai = Restaurant.create(name: "Thai")
greek = Restaurant.create(name: "Greek Place")
mcdonalds = Restaurant.create(name: "McDonalds")
r1 = Restaurant.create(name: Faker::Restaurant.name)
r2 = Restaurant.create(name: Faker::Restaurant.name)

padthai = MenuItem.create(food_name: "Pad Thai", price: 13.99)
padthai.restaurant = thai
padthai.save

salad = MenuItem.create(food_name: "Greek Salad", price: 10.50)
salad.restaurant = greek
salad.save

gyro = MenuItem.create(food_name: "Gyro", price: 9.50)
gyro.restaurant = greek
gyro.save

bigmac = MenuItem.create(food_name: "Big Mac", price: 3.99)
bigmac.restaurant = mcdonalds
bigmac.save

mi1 = MenuItem.create(food_name: Faker::Food.dish, price: Faker::Number.decimal(l_digits: 2, r_digits: 2))
mi1.restaurant = r1
mi1.save

mi2 = MenuItem.create(food_name: Faker::Food.dish, price: Faker::Number.decimal(l_digits: 2, r_digits: 2))
mi2.restaurant = r2
mi2.save

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

order5 = Order.create
order5.customer = c4
order5.menu_item = mi2
order5.save