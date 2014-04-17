class EventsController < ApplicationController
  before_filter :find_event, :only => [ :show, :edit, :update, :destroy]

  def sayHello
    render:text => "Hello"
  end

  respond_to do |format|
    format.html
    format.js
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    flash[:notice] = "event was successfully created"
    @event = Event.new(user_params)
    if @event.save
      redirect_to :action => :show, :id=>@event
    else
      render :action => :new
    end
  end

  def show
    @page_title = @event.name
  end

  def edit
  end

  def update
    
    @event.update_attributes(user_params)
    redirect_to :action => :show, :id => @event
  end

  def destroy
    @event.destroy
    redirect_to :action => :index
  end

  def user_params
    params.require(:event).permit(:name, :description)
  end
  
  protected
  def find_event
    @event = Event.find(params[:id])
  end
end
