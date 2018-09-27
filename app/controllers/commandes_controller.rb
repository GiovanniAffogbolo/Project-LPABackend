class CommandesController < ApplicationController
  
  skip_before_action :verify_authenticity_token, :only => [:create]
  
  def index
    
    @commandes = Commande.all
  
  #  puts params.inspect
  #  render json: params
  end
  
end
