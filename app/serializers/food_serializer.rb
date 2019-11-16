class FoodSerializer
  include FastJsonapi::ObjectSerializer
  attributes :category, :emission_amount
end
