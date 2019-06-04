class ShortLinksController < ApplicationController
  before_action :set_short_link, only: [:index, :show, :edit, :update]

  def index
  end

  def new
    @short_link = ShortLink.new
  end

  def create
    shortened_url = ShortLink.new
    shortened_url.save

    redirect_to :i_dont_know
  end

  def show
  end

  def edit
  end

  def update
    if @short_link.update(short_link_params)
      # redirect_to ...
    else
      # redirect_to ...
    end
  end

  private

  def short_link_params
    params.require(:short_link).permit(:view_count)
  end

  def set_short_link
    @short_link = ShortLink.find(params[:id])
  end
end
