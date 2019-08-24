class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @events = Event.where('confirmed = true AND end_date >= ?', DateTime.now).order('end_date ASC')

    if params[:query].present?
      search = Event.search_event_scope(params[:query])
      @events = search.confirmed
    else
      @events = Event.where('confirmed = true AND end_date >= ?', DateTime.now).order('end_date ASC')
    end
  end
end
