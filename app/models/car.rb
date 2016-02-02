class Car < ActiveRecord::Base
  BUDGET = 8000000

  def self.getCombination
    all_model = Car.all
    combination = {}
    budget = BUDGET
    index = 0

    while budget > 0 do
      name = all_model[index].name

      if combination[name]
        combination[name] = combination[name] + 1
      else
        combination[name] = 1
      end

      budget = budget - all_model[index].amount

      if index < all_model.size - 1
        index = index + 1
      else
        index = 0
      end
    end

    return combination
  end
end
