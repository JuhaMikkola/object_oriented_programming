# module Utils #More next week, use it for rounding, code that will be used in a bunch of places in one place
#   def self.round(price)
#     return price if price % 5 == 0 #This gives the REMAINDER and is the GUARD CLAUSE
#     price + 5 - (price % 5)
#   end
#   def self.format_price(price)
#       sprintf('%.2f', price/100.00)
#   end
# end

class Product #This is a factory, has two things data (state - which we give it) and behaviour. Tell don't ask principle.
  # include Utils

  attr_accessor :quantity, :name, :price       #Can use this and still the instance variables too, rather than calling methods for variables (too confusing) 

  def initialize (quantity, name, price)       #Need to set up and initialize the variables to store info
      @quantity = quantity                     #Don't name a method after a variable
      @name = name                           #Anything that needs the object needs are set up here
      @price = price #* 100                     #Without the @ it can only be accessed in the method (scope), do this turn to integer  when you are going to work with money. Then turn it back when you show the user.
      # @@completetaxamount = 0
      # @@completeprice = 0
  end

  def sales_tax
    subtotal * tax_rate
  end

  def total_price
   (subtotal + sales_tax)
   #.round(2)  #This does not seem to make any difference?
   # = p
   # p + @@completeprice
   # return p
  end

  def subtotal
    (@quantity * @price)
  end

  def tax_rate
    0.10 #Standard tax rate
  end

end

class Imported < Product                     #AHA imported product is a kind of product, sub-class of product
  def tax_rate
    0.15
    #super + 0.05                             #Import tax rate runs the parent method of the same name and adds 5%
  end
end

class Exempt < Product
  def tax_rate
    0
  end
end

class Importedexempt < Exempt
  def tax_rate
    0.05
    # super + 0.05
  end
end

# class ShoppingCart
#   def additem 
#   end
#   def printreceipt
#   end
# end

# def allmytotal(*items)
#   items.each {|x| }
# end


# product = Product.new(1, "book", 12.49)
# #Need to give the factory some information, like the colour of the car you want made,
# #putting the information in the order of the question and also the method. Need to initialize for three vars

# puts "PRODUCT"

# puts product.tax_rate
# puts product.sales_tax                      #You could also do these outside the class but it will be messy!
# puts product.total_price                    #START HERE by making these your test - what you want to be able to run so code it!

# #puts "#{@@completeprice}"

# imported = Imported.new(1, "imported book", 24.95)

# puts "IMPORTED"

# puts imported.tax_rate                      #Select one, then hit command D to change further ones
# puts imported.sales_tax                     
# puts imported.total_price    

# exempt = Exempt.new(1, "chocolatebar", 0.85)

# puts "EXEMPT"

# puts exempt.tax_rate                      
# puts exempt.sales_tax                     
# puts exempt.total_price    

# importedexempt = Importedexempt.new(1, "chocolatebar", 17.85)

# puts "IMPORTED EXEMPT"

# puts importedexempt.tax_rate                     
# puts importedexempt.sales_tax                     
# puts importedexempt.total_price    

  # First Shopping Session
  item_1A = Exempt.new(1, "book", 12.49)
  item_1B = Product.new(1, "music CD", 14.99)
  item_1C = Exempt.new(1, "chocolate bar", 0.85)

  input_1 = [item_1A, item_1B, item_1C]

  total_tax = 0
  total = 0

    puts "\nOutput 1:"
    input_1.each do |i|
      puts "#{i.quantity} #{i.name} : #{i.total_price}"
      total_tax += ((i.tax_rate) * (i.price))
      total += i.total_price
    end

    puts "Sales Taxes: #{total_tax}"
    puts "Total: #{total}"

      # Second Shopping Session, issue with the sales tax
  item_2A = Importedexempt.new(1, "imported box of chocolates", 10.00)
  item_2B = Imported.new(1, "bottle of perfume", 47.50)
  
  input_2 = [item_2A, item_2B]

  total_tax = 0
  total = 0

    puts "\nOutput 2:"
    input_2.each do |i|
      puts "#{i.quantity} #{i.name} : #{i.total_price}"
      total_tax += ((i.tax_rate) * (i.price))
      total += i.total_price
    end

    puts "Sales Taxes: #{total_tax}"
    puts "Total: #{total}"

      # Third Shopping Session
  item_3A = Imported.new(1, "imported bottle of perfume", 27.99)
  item_3B = Product.new(1, "bottle of perfume", 18.99)
  item_3C = Exempt.new(1, "packet of headache pills", 9.75)
  item_3D = Importedexempt.new(1, "imported box of chocolates", 11.25)

  input_3 = [item_3A, item_3B, item_3C, item_3D]

  total_tax = 0
  total = 0

    puts "\nOutput 3:"
    input_3.each do |i|
      puts "#{i.quantity} #{i.name} : #{i.total_price}"

      total_tax += ((i.tax_rate) * (i.price))
      total += i.total_price
    end

    puts "Sales Taxes: #{total_tax}"
    puts "Total: #{total}"

# PREVIOUS WORK
# productshash = {:book => "12.49", :musiccd => "14.99", :chocolatebar => "0.85"}
# taxrateshash = {:book => "0", :musiccd => "0.1", :chocolatebar => "0.1"}
# keysarray = [:book,:musiccd,:chocolatebar]

# #key book , value 

# $totaltax
# keysarray.each do |a|
#   taxrateshash[a] - #refer to hash to obtain rate and price
#   #returnvalue to price
#   #add to sales tax
# end

# $totalprice = 0
# keysarray.each do |a|
#   #search hash for a
#   #returnvalue to price
#   #add to sales tax
# end


# # $TotalTax

# # #SalesTax
# # def salestax(key,value)

# #   if productshash.key?(:book)
# #     then productshash(:book).value * taxrateshash(:book).value = a

# #   elsif productshash.key?(:musiccd)
# #     then productshash(:musiccd).value * taxrateshash(:musiccd).value = b

# #   else productshash.key?(:chocolatebar)
# #     then productshash(:chocolatebar).value * taxrateshash(:chocolatebar).value = c
      
# #   end
# #   $TotalTax + a + b + c

# # end


# # #Exempt 0%

# # #Import 5%

# # #Calculate Total Price

# # puts productshash
# # puts $TotalTax
# # puts 