class ShortLinksController < ApplicationController
  before_action :set_short_link, only: [:show, :edit, :update]

  def index
    shortened_url_key = params[:shortened_url_key]
    short_link = ShortLink.where(shortened_url_key: shortened_url_key).first
    original_url = short_link.original_url
    view_count = short_link.view_count
    short_link.update(view_count: view_count + 1)

    redirect_to fix_url(original_url)
  end

  def show
  end

  def new
    @short_link = ShortLink.new
  end

  def edit
    # Possible TODO: add ability to create custom shortened_url_key
  end

  def create
    original_url = params[:short_link]['original_url']
    shortened_url_key = ShortLink.create_shortened_url_key
    admin_url_key = ShortLink.create_admin_url_key

    loop do
      @short_link = ShortLink.create(
        original_url: original_url,
        shortened_url_key: shortened_url_key,
        admin_url_key: admin_url_key
      )

      break if @short_link.valid?
    end

    redirect_to short_link_path(@short_link)
  end

  def update
    # Possible TODO: implement this action if allow custom key feature
  end

  def destroy
    @short_link = ShortLink.find(params[:id])
    @short_link.destroy

    redirect_to :root
  end

  def admin
    admin_url_key = params[:admin_url_key]
    @short_link = ShortLink.where(admin_url_key: admin_url_key).first
  end

  private

  def set_short_link
    @short_link = ShortLink.find(params[:id])
  end

  def fix_url(str)
    (str.starts_with?('http://') || str.starts_with?('https://')) ? (
      str
    ) : (
      "http://#{str}"
    )
  end
end
