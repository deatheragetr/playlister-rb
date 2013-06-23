module FindByName
  def find_by_name(name)
    name.downcase!
    object = self.all.select do |instance|
      instance.name.downcase == name
    end
    object[0]
  end
end