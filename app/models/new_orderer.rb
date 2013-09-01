class NewOrderer
  def order(links)
    links.sort { |first, second| second.created_at <=> first.created_at }
  end
end
