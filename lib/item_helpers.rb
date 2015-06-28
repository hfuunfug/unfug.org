#
# get all items of a kind
#
def only_ items, kind
  items.select { |item| item.attributes[:kind] == kind }
end

#
# Get all items of kind talk
#
def only_talks items
  only_ items, :talk
end

#
# Get all items of kind blog
#
def only_blogs items
  only_ items, :blog
end

#
# Get all items of kind member
#
def only_members items
  only_ items, :member
end


#
# Check whether a item is of a kind
#
def is_kind? k, itm
  itm.attributes[:kind] == k
end

#
# Check whether a item is of the kind talk
#
def is_talk? itm
  is_kind? :talk, itm
end

#
# Check whether a item is of the kind blog
#
def is_blog? itm
  is_kind? :blog, itm
end

#
# Check whether a item is of the kind member
#
def is_member? itm
  is_kind? :member, itm
end
