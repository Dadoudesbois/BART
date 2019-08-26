class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      params_query = params[:query]
      unaccented_query = ActiveSupport::Inflector.transliterate(params_query)
      search = Event.search_event_scope(unaccented_query)
      @events = confirmed_current_events_filter(search)
    else
      @events = confirmed_current_events_filter(Event.all).order('end_date ASC')
    end
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
