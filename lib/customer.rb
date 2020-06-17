class Customer < ActiveRecord::Base 
    has_many :orders
    has_many :menu_items, through: :orders
    has_many :restaurants, through: :menu_items

    def place_order(menu_item)
        o1 = Order.create
        o1.customer = self
        o1.menu_item = menu_item
        o1.save
        o1
    end

    def orders
        Order.all.select do |order|
            order.customer == self
        end
    end

    def last_order
        orders.last
    end

    def update_last_order(menu_item)
        last_order = self.last_order
        last_order.menu_item = menu_item
        last_order.save
        last_order
    end

    def cancel_last_order
        self.last_order.destroy
    end

    def change_username(new_un)
        self.update(username: new_un)
    end

end