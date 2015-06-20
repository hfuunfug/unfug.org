# Tag helpers


def all_tags items
  items.map { |i| i.attributes[:tags] || [] }.flatten.uniq.sort
end
