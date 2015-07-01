require 'date'

def past_talks items
  limit = Date.today
  items.select do |i|
    i.attributes[:kind] == :talk and i.attributes[:date] <= limit
  end.sort_by { |i| i.attributes[:date] }
end

def upcoming_talks items
  limit = Date.today
  items.select do |i|
    i.attributes[:kind] == :talk and i.attributes[:date] > limit
  end.sort_by { |i| i.attributes[:date] }
end

