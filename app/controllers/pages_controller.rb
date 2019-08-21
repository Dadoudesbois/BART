class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @events = Event.where('start_date >= ?', DateTime.now.beginning_of_day).order('created_at ASC')
  end
end
