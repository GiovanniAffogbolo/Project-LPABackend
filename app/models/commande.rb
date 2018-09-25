class Commande < ApplicationRecord
  has_many :pizza, through: :commande_line 
end
