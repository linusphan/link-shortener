class ShortLinksController < ApplicationController
  before_action :fetch_short_link, only: [:index, :show, :edit, :update]

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
    if @short_link.update whatdoes: :this_do
      redirect_to :somewhere
    else
      redirect_to :somewhere_else
    end
  end

  private

  def fetch_short_link
    @short_link = ShortLink.find(params[:id])
  end
end
