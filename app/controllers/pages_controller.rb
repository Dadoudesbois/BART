class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @events = confirmed_current_events_filter(Event.all).order('end_date ASC')
    bars_and_markers_for_map(@events)
  end

  private

  def confirmed_current_events_filter(events)
    events.where('confirmed = true AND end_date >= ?', DateTime.now)
  end

  def markers_map(bars)
    bars.map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar }),
        image_url: helpers.asset_url('ampoule.png')
      }
    end
  end

  def bars_and_markers_for_map(events)
    @bars = events.map(&:bar)
    @markers = markers_map(@bars)
  end
end
