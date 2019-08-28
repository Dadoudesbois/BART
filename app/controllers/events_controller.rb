class EventsController < ApplicationController
  before_action :set_event, only: [:preview, :show, :edit, :update, :confirm, :destroy]
  before_action :bar_authorization, only: [:new, :create]
  before_action :owner_authorization, only: [:edit, :update, :delete]

  skip_before_action :authenticate_user!, only: [:preview, :search]

  def index
    @events = confirmed_current_events_filter(Event.all).order('end_date ASC')
    bars_and_markers_for_map(@events)

    ######################## researches to fix the map - to discuss together

    # @events_bar = []
    # ### @events_bar = Bar.geocoded where ... ?

    # @events.each do |event|
    #   event.bar = bar
    #   @events_bar << bar
    # end

    # @markers = @events_bar.map do |bar|
    #   {
    #     lat: bar.latitude,
    #     lng: bar.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { bar: bar }),
    #     image_url: helpers.asset_url('Sea-breeze.png')
    #   }
    # end

    # @markers = @events.map do |event|
    #   [{
    #     lat: event[:bar].address.latitude,
    #     lng: event[:bar].address.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { bar: event[:bar].address }),
    #     image_url: helpers.asset_url('Sea-breeze.png')
    #   }]
    # end

    # @markers = @bars.map do |bar|
    #   {
    #     lat: bar.latitude,
    #     lng: bar.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { bar: bar }),
    #     image_url: helpers.asset_url('Sea-breeze.png')
    #   }
    # end

    ######################## // researches
  end

  def preview
    @artist = @event.user.profile

    @bar = @event.bar

    @markers = [{
      lat: @bar.latitude,
      lng: @bar.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { bar: @bar }),
      image_url: helpers.asset_url('Sea-breeze.png')
    }]

    @pictures = @bar.pictures

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @artist = @event.user.profile

    @bar = @event.bar

    @markers = [{
      lat: @bar.latitude,
      lng: @bar.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { bar: @bar }),
      image_url: helpers.asset_url('Sea-breeze.png')
    }]

    @pictures = @bar.pictures
  end

  def new
    @event = Event.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    @event = Event.new(event_params)
    @profile = Profile.find(params[:profile_id])
    @event.user = @profile.user
    # Should be a select if a user has multiple bars

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def confirm
    @event.confirmed = true
    @event.save
    redirect_to dashboard_profile_path(@event.user.profile)
  end

  def destroy
    @event.destroy

    redirect_to dashboard_profile_path(current_user.profile)
  end

  def search
    perform_search
    respond_to do |format|
      format.js # <-- will render `app/views/events/search.js.erb`
    end
  end

  private

  def perform_search
    unaccented_query = ActiveSupport::Inflector.transliterate(params[:event_search][:content])
    search = Event.search_event_scope(unaccented_query)
    @events = confirmed_current_events_filter(search)
    bars_and_markers_for_map(@events)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:start_date, :end_date, :description, :photo, :name, :category, :bar_id)
  end

  def bar_authorization
    redirect_back(fallback_location: root_path, flash: 'You are not authorized to perform this action') if current_user.profile.is_bar_manager == false
  end

  def owner_authorization
    redirect_back(fallback_location: root_path, flash: 'You are not authorized to perform this action') if @event.bar.user != current_user
  end

  def confirmed_current_events_filter(events)
    events.where('confirmed = true AND end_date >= ?', DateTime.now)
  end

  def markers_map(bars)
    bars.map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar }),
        image_url: helpers.asset_url('Sea-breeze.png')
      }
    end
  end

  def bars_and_markers_for_map(events)
    @bars = events.map(&:bar)
    @markers = markers_map(@bars)
  end

  def is_navbar_white?
    if action_name == 'new'
      return true
    elsif
      action_name == 'edit'
      return true
    else
      return false
    end
  end
end
