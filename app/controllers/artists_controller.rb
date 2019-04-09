# frozen_string_literal: true

class ArtistsController < ApplicationController
  include Pagy::Backend

  before_action :require_login

  def index
    records = Artist.search_by_name(params[:query]).with_attached_image.order(:name)
    @pagy, @artists = pagy_countless(records)
  end

  def show
    @artist = Artist.find(params[:id])
    @pagy, @albums = pagy_countless(@artist.albums.with_attached_image)

    AttachArtistImageFromDiscogsJob.perform_later(@artist.id) unless @artist.has_image?
  end
end