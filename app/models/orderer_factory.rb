class OrdererFactory
  def self.build(type)
    case type
    when :top
      TopOrderer.new
    when :new
      NewOrderer.new
    when :old
      OldOrderer.new
    end
  end
end
