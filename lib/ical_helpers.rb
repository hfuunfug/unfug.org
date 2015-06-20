require 'icalendar'
require 'date'

def generate_ical_items cfg
  ical = Icalendar::Calendar.new
  only_talks(@items).each do |item|
    event = Icalendar::Event.new
    event.dtstart = item[:date].to_datetime + (cfg[:unfug_starttime] / 24.0)
    event.dtend   = item[:date].to_datetime + (cfg[:unfug_endtime]   / 24.0)
    event.summary = "Unfug"
    event.description = item[:speakers].join(", ") + " - " + item[:title]
    ical.add_event event
  end

  @items << Nanoc::Item.new(ical.to_ical, {:kind => :ical}, "/ical/")
end
