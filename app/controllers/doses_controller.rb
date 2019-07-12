class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create, :new]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    respond_to do |format|
      if @dose.save
        format.html { redirect_to @cocktail, notice: 'Dose was successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
     @dose = Dose.find(params[:id])
     @dose.destroy
     redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
