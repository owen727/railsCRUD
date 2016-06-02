class EventsController < ApplicationController


def index
    
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml {
        render :xml => @events.to_xml 
      }
      format.json {
        render :json => @events.to_json
      }
      format.atom {
        @feed_title = "My event list"
      } #index.atom.builder
    end
  end

  # GET /events/new  #show form
  def new
    @event = Event.new
  end



















end
