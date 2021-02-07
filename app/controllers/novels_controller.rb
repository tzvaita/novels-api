class NovelsController < ApplicationController
  before_action :set_novel, only: [:show, :update, :destroy]

  # GET /novels
  def index
    @novels = Novel.all
    json_response(@novels)
  end

  # POST /novels
  def create
    @novel = Novel.create!(novel_params)
    json_response(@novel, :created)
  end

  # GET /novels/:id
  def show
    json_response(@novel)
  end

  # PUT /novels/:id
  def update
    @novel.update(novel_params)
    head :no_content
  end

  # DELETE /novels/:id
  def destroy
    @novel.destroy
    head :no_content
  end

  private

  def novel_params
    # whitelist params
    params.permit(:title, :user_id)
  end

  def set_novel
    @novel = Novel.find(params[:id])
  end
end
