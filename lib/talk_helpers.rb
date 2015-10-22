require 'date'

def fetch_talks items, cmp
  items.select do |i|
    a = i.attributes
    a[:kind] == :talk and a[:date].to_datetime.send cmp, DateTime.now
  end.sort_by { |i| i.attributes[:date].to_datetime }
end

def semester_start cfg, year
  DateTime.parse("#{cfg}-#{year}")
end

def summer_semester_start year
  semester_start @config[:page][:semester][:summer_start_date], year
end

def winter_semester_start year
  semester_start @config[:page][:semester][:winter_start_date], year
end

def decide_semester date
  year = date.year
  if date >= winter_semester_start(year.pred) and date < summer_semester_start(year)
    "#{year.pred} WS"
  elsif date > summer_semester_start(year) and date <= winter_semester_start(year)
    "#{year} SS"
  else # date > winter_semester_start(year) and date <= summer_semester_start(year.succ)
    "#{year} WS"
  end
end

def get_daterange_for_talk talk
  decide_semester talk.attributes[:date].to_datetime
end

def past_talks_by_semester items
  fetch_talks(items, :<=).reverse.group_by { |t| get_daterange_for_talk t }
end

def past_talks items
  fetch_talks(items, :<=).reverse
end

def upcoming_talks items
  fetch_talks items, :>
end

