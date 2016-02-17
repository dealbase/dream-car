class Car < ActiveRecord::Base


  def self.more_cars(amt, cars_array)
    
    this_car = cars_array.first
    rest = cars_array[0,-1]
    max_amount = (amt/this_car.amount).to_i
    (0..max_amount).each do |cnt|
      speant_on_this_car = cnt * this_car.amount
      left_over = amt - speant_on_this_car
      car_amount_set = [{car: car, amount: cnt, cost: speant_on_this_car}] + more_cars(left_over, rest)
    end
    
    return car_amount_set

  end

end
