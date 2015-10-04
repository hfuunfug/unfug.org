require 'date'

def fetch_talks items, cmp
  items.select do |i|
    a = i.attributes
    a[:kind] == :talk and a[:date].to_datetime.send cmp, DateTime.now
  end.sort_by { |i| i.attributes[:date].to_datetime }
end

def past_talks items
  fetch_talks items, :<=
end

def upcoming_talks items
  fetch_talks items, :>
end

