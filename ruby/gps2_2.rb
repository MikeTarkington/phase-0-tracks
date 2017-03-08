# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # [fill in any steps here]
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]
=begin
#deciding to go with a hash
#will store list item as a key and qty as value
write our hash data that the list will work from
=end


def list_creator(list_items)
  p shop_list_arr = list_items.split(" ")
  completed_list = Hash.new(0)
    shop_list_arr.each do |item|
      completed_list[item] += 1
    end
  p completed_list
  end

our_list = list_creator("carrots apples cereal pizza pizza")

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
# output:

def item_adder(grocery_list, item_name, qty)
  grocery_list[item_name] += qty
  grocery_list
end

p item_adder(our_list, "bread", 2)

# Method to remove an item from the list
# input:
# steps:
# output:

def item_remover(grocery_list, item_name)
  grocery_list.delete(item_name)
  grocery_list
end

p item_remover(our_list, "carrots")

# Method to update the quantity of an item
# input:
# steps:
# output:

def item_qty(grocery_list, item_name, qty)
  grocery_list[item_name] = qty
  grocery_list
end

p item_qty(our_list, "apples", 5)

# Method to print a list and make it look pretty
# input:
# steps:
# output:

def list_print(grocery_list)
  grocery_list.each do |item, qty|
    puts "Item: #{item}... Quantity: #{qty}"
  end
end

list_print(our_list)
