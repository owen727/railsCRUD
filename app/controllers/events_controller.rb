class EventsController < ApplicationController

  before_action :set_event, :only => [:show, :edit, :update, :destroy]

  def index
    
    @events = Event.page( params[:page] ).per(10)

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml {
    #     render :xml => @events.to_xml 
    #   }
    #   format.json {
    #     render :json => @events.to_json
    #   }
    #   format.atom {
    #     @feed_title = "My event list"
    #   } #index.atom.builder
    # end

    # @page_title = @events.name 比較喜歡固定title

  end

  # GET /events/new  #show form
  def new
    @event = Event.new
  end

  def create
    @event = Event.new( event_params )
    if @event.save #save成功會回傳true
      flash[:notice] = "New Book Added"
      redirect_to events_path # HTTP code: 303
    else
      render :action => :new
    end

  end

  def show
    @page_title = @event.name
  end

  def edit
    @page_title = @event.name
  end

  def update  
   if @event.update(event_params)
      flash[:notice] = "Information Updated "
      redirect_to event_path(@event)
    else
      render :action => :edit
    end 
    
  end

  def destroy
    @event.delete
    flash[:alert] = "Book Deleted"
    redirect_to events_path
  end  




  private
    
  def event_params
      params.require(:event).permit(:name, :description, :isbn)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
