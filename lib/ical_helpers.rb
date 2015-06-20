require 'icalendar'

def generate_ical_items
  ical = Icalendar::Calendar.new
  only_talks(@items).each do |item|
    event = Icalendar::Event.new
    event.dtstart = item[:date]
    event.dtend   = item[:date]
    event.summary = "Unfug"
    event.description = item[:speakers].join(", ") + " - " + item[:title]
    ical.add_event event
  end

  @items << Nanoc::Item.new(ical.to_ical, {:kind => :ical}, "/ical/")
end
