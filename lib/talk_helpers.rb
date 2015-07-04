require 'date'

def past_talks items
  limit = Date.today
  items.select do |i|
    i.attributes[:kind] == :talk and i.attributes[:date].to_datetime <= limit
  end.sort_by { |i| i.attributes[:date].to_datetime }
end

def upcoming_talks items
  limit = DateTime.now
  items.select do |i|
    i.attributes[:kind] == :talk and i.attributes[:date].to_datetime > limit
  end.sort_by { |i| i.attributes[:date].to_datetime }
end

