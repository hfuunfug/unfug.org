require 'icalendar'
require 'date'

def generate_event item, cfg
  event = Icalendar::Event.new
  event.dtstart = item[:date].to_datetime + (cfg[:page][:unfug][:start] / 24.0)
  event.dtend   = item[:date].to_datetime + (cfg[:page][:unfug][:end]   / 24.0)
  event.summary = "UnFUG"
  if item[:speakers]
    event.description = item[:speakers].join(", ") + " - " + item[:title]
  else
    event.description = item[:title]
  end
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

  @items.create(ical.to_ical, {:kind => :ical}, "/ical/")
end

def generate_ical_items_latest cfg
  latest = cfg[:page][:ical][:latest]
  return if latest.nil? or latest == false

  ical = Icalendar::Calendar.new
  only_talks(@items).sort_by {|i| i[:date] }.reverse.take(latest).each do |item|
    ical.add_event generate_event(item, cfg)
  end

  @items.create(ical.to_ical, {:kind => :ical}, "/ical-latest/")
end

