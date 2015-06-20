require 'date'

def past_and_next_talks items
  limit = Date.today + 7
  items.select do |i|
    i.attributes[:kind] == :talk and i.attributes[:date] <= limit
  end.sort_by { |i| i.attributes[:date] }
end
