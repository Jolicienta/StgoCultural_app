class FavoritesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @favorite = current_user.favorites.where(event: @event, assist:false).first
    if @favorite.present?
      redirect_to root_path, notice: 'Este evento ya está en tu lista'
    else
      @favorite = Favorite.new(event: @event, user: current_user, assist: false)
      @favorite.save
      redirect_to root_path, notice: 'Has agregado un nuevo evento a Favoritos'
    end
  end

  def favoritelist
    @favorites = Favorite.all
    @favorites.save
  end

  def remove_favorite_event
    @favorite = Favorite.find(params[:favorite_id])
    @favorite.quantity -= 1 if @order.quantity > 1
    @favorite.save if @favorite.changed?
    redirect_to edit_user_registration_path, notice: 'El evento ha sido eliminado de Favoritos'
  end

end
