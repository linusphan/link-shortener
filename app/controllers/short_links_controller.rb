class ShortLinksController < ApplicationController
  before_action :set_short_link, only: [:index, :show, :edit, :update]

  def index
  end

  def show
  end

  def new
    @short_link = ShortLink.new
  end

  def edit
  end

  def create
    original_url = params[:short_link]['original_url']
    shortened_url_key = ShortLink.create_shortened_url_key

    loop do
      @short_link = ShortLink.create(
        original_url: original_url,
        shortened_url_key: shortened_url_key
      )

      break if @short_link.valid?
    end

    redirect_to short_link_path(@short_link)
  end

  def update
    if @short_link.update(short_link_params)
    else
    end
  end

  def destroy
  end

  private

  def set_short_link
    @short_link = ShortLink.find(params[:id])
  end
end
