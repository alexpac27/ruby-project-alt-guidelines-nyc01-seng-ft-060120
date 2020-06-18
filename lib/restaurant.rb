class Restaurant < ActiveRecord::Base 
    has_many :menu_items
    has_many :orders, through: :menu_items
    has_many :customers, through: :orders

    def menu_items
        MenuItem.all.select { |mi| mi.restaurant == self} 
    end

    def return_menu_string
        self.menu_items.map{|item_obj| "#{item_obj.food_name} ---> $#{item_obj.price}"}
    end

    
end

# binding.pry