class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :update, :destroy]

  # GET /favorites
  def index
    @favorites = Favorite.all
    json_response(@favorites)
  end

  # POST /favorites
  def create
    @favorite = Favorite.create!(favorite_params)
    json_response(@favorite, :created)
  end

  # GET /favorites/:id
  def show
    json_response(@favorite)
  end

  # PUT /favorites/:id
  def update
    @favorite.update(favorite_params)
    head :no_content
  end

  # DELETE /favorites/:id
  def destroy
    @favorite.destroy
    head :no_content
  end

  private

  def favorite_params
    # whitelist params
    params.permit(:liker_id, :liked_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end
