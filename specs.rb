class Specs
  def initialize(client, event, event_name, event_values, type, row)
    @c = client
    @d = {}
    @e = event
    @name = event_name
    @values = event_values
    @type = type
    @row = row
    request
  end

  def event
    @e
  end

  def event_name
    @name
  end

  def event_values
    @values
  end

  def request
    @d = @c.request(
    'events/properties',
    event:     @e,
    name:      @name,
    type:      @type,
    unit:      'day',
    from_date: DateTime.now.to_date - 14,
    to_date:   DateTime.now.to_date
    )
    
    @d.inspect 
  end

  def previous_week
      previous_week = Hash[@d["data"]["values"][@values].sort.sort_by{|k,v| -v}[7..13]].values.reduce(:+) 
  end

  def last_week
      last_week = Hash[@d["data"]["values"][@values].sort.sort_by{|k,v| -v}[0..6]].values.reduce(:+)
  end

  def yesterday
      y = DateTime.now - 1
      yesterday = @d["data"]["values"][@values][y.to_date.strftime('%Y-%m-%d')]
  end

  def insert
    sign_up_worksheet = Spreadsheet.new(self, "1BbWbWQ6lLqGtaMMlpaWhsqCkZWTF-Bl0F4ZfC4wxYkY", @row)
    sign_up_worksheet.insert
  end

end