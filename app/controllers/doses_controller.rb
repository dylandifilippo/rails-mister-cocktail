class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(params_dose)
    @cocktail = Cocktail.find(params[:id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end
end
