# frozen_string_literal: true

class SongCollectionsController < ApplicationController
  before_action :require_login

  def index
    @song_collections = Current.user.song_collections.order(id: :desc)
  end

  def show
    @song_collection = SongCollection.find_by(id: params[:id])
    head :not_found unless @song_collection.present?

    @playlist = @song_collection.playlist
  end

  def create
    @song_collection = Current.user.song_collections.new song_collection_params

    if @song_collection.save
      flash.now[:success] = t('text.create_success')
    else
      flash.now[:error] = @song_collection.errors.full_messages.join(' ')
    end
  end

  private

    def song_collection_params
      params.require(:song_collection).permit(:name)
    end
end