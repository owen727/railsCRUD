class EventsController < ApplicationController


def index
    
    @events = Event.all

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
  end

  # GET /events/new  #show form
  def new
    @event = Event.new
  end

  def create
    @event = Event.new( event_params )
    
    @event.save
    
    redirect_to events_path # HTTP code: 303
  end

  def show
    @event = Event.find(params[:id])
    
  end







  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to events_path


  end  


  private
    
  def event_params
      params.require(:event).permit(:name, :description, :isbn)
  end

end
