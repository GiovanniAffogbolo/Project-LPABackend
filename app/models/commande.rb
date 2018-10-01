class Commande < ApplicationRecord
  has_many :pizzas, through: :commande_lines 
end
