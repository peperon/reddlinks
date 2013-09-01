class TopOrderer
  def order(links)
    links.sort { |first, second| second.rating <=> first.rating }
  end
end
