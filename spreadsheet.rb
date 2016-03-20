class Spreadsheet
	def initialize(event, key, row)
    @event = event
		@key = key
    @ws = {}
    @session = GoogleDrive.saved_session("config.json")
    @row = row
    connect
	end

  def connect
    @ws = @session.spreadsheet_by_key(@key).worksheets[0]
  end

  def insert
    @ws.list[@row]["Description"] = @event.event
    @ws.list[@row]["Previous week"] = @event.previous_week
    @ws.list[@row]["Past week"] = @event.last_week
    @ws.list[@row]["Yesterday"] = @event.yesterday
    @ws.list[@row]["Event"] = @event.event_name
    @ws.list[@row]["Properties"] = @event.event_values
    @ws.save
  end

end