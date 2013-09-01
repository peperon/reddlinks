class OldOrderer
  def order(links)
    links.sort { |first, second| first.created_at <=> second.created_at }
  end
end
