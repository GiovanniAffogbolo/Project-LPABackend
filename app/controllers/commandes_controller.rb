class CommandesController < ApplicationController
  
  skip_before_action :verify_authenticity_token, :only => [:create]
  
  def index
    
    @commandes= []
    @allCommandes = Commande.all
    @allCommandes.each do |commande|
      pizzas = []
      @commandeslines=CommandeLine.where(commande: commande)
      @commandeslines.each do |cmdLine|
          pizza = Pizza.find(cmdLine[:pizza_id])
          pizzas.push(pizza)
      end
      p "commandes"
      @commandes.push({commande: commande ,pizzas: pizzas})
    end  
  #  puts params.inspect
  #  render json: params
  end
  
  def create 
    
    p "commandesController"
    @name = params[:name]
    @adresse = params[:adresse]
    p @adresse
    @pizzas = params[:pizzas]
    newCommande = Commande.new(:name => @name, :adresse => @adresse)
    newCommande.save
    p @pizzas
    @erros="Erros : [";
    @pizzas.each do |pizza|
    @commandePizza =Pizza.where(name: pizza).first
    if @commandePizza.nil?
      @erros= @erros+" - There is no pizza with name = "+pizza
      p @erros
      next
    end 
    p @commandePizza
    newCommande_Line = CommandeLine.new
    newCommande_Line.commande=newCommande
    newCommande_Line.pizza=@commandePizza
    newCommande_Line.save
    end
    @erros = @erros + "]"
  end
  
end



