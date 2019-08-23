class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @events = Event.where('confirmed = true AND end_date >= ?', DateTime.now.end_of_day).order('end_date ASC')
  end
end
