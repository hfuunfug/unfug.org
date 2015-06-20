def only_ items, kind
  items.select { |item| item.attributes[:kind] == kind }
end

def only_talks items
  only_ items, :talk
end

def only_blogs items
  only_ items, :blog
end

def only_members items
  only_ items, :member
end


def is_kind? k, itm
  itm.attributes[:kind] == k
end

def is_talk? itm
  is_kind? :talk, itm
end

def is_blog? itm
  is_kind? :blog, itm
end

def is_member? itm
  is_kind? :member, itm
end
