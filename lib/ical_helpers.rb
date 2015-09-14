require 'icalendar'
require 'date'

def generate_event item, cfg
  event = Icalendar::Event.new
  event.dtstart = item[:date].to_datetime + (cfg[:unfug_starttime] / 24.0)
  event.dtend   = item[:date].to_datetime + (cfg[:unfug_endtime]   / 24.0)
  event.summary = "Unfug"
  event.description = item[:speakers].join(", ") + " - " + item[:title]
  event
end

#
# Generate ical calendar for all talks
#
# @param cfg Hash with keys :unfug_starttime and :unfug_endtime, values between
# 0 and 24 (as Integer, representing full hours)
#
def generate_ical_items cfg
  ical = Icalendar::Calendar.new
  only_talks(@items).each do |item|
    ical.add_event generate_event(item, cfg)
  end

  @items << Nanoc::Item.new(ical.to_ical, {:kind => :ical}, "/ical/")
end

def generate_ical_items_latest cfg
  ical = Icalendar::Calendar.new
  only_talks(@items).take(15).each do |item|
    ical.add_event generate_event(item, cfg)
  end

  @items << Nanoc::Item.new(ical.to_ical, {:kind => :ical}, "/ical-latest/")
end

