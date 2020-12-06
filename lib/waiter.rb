class Waiter
        attr_accessor :name, :years

        @@all = []

        def initialize(name, years)
            @name = name
            @years = years
            @@all << self
        end

        def self.all
            @@all
        end

        def new_meal(customer, total, tip=0)
            Meal.new(self, customer, total, tip)
        end

        def meals
            Meal.all.select {|meal| meal.waiter == self}
        end

        def best_tipper
            largest_tip = meals.max do |x, y| 
                x.tip <=> y.tip
        end
            largest_tip.customer
        end
end
