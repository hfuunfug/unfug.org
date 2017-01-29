# Tag helpers

#
# Get all tags
#
def all_tags items
  items.map { |i| i.attributes[:tags] || [] }.flatten.uniq.sort
end

#
# Generate a page for each tag
#
def generate_tag_pages
  all_tags(items).each do |tag|
    items.create("", { :tag => tag }, "/tags/#{tag}/")
  end
end

