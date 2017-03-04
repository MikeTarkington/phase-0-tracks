class TodoList

  #syntax sugar for creating getter methods
  attr_reader :get_item
  #syntax suggar for creating setter methods which actually also serve getter purposes
  attr_accessor :add_item, :delete_item

  def initialize(base_list)
    @list = base_list
  end

  def get_items
      @list
  end

  def add_item(list_item)
     @list << list_item
  end

  def delete_item(list_item)
    @list.delete(list_item)
    @list
  end

  def get_item(list_item_idx)
    @list[list_item_idx]
  end
end
#p TodoList.new.get_items([@dishes, @lawn])
p test_instance = TodoList.new(["do the dishes", "mow the lawn"])
p test_instance.get_items
p test_instance.add_item("mop")
p test_instance.delete_item("mow the lawn")
p test_instance.get_item(0)
