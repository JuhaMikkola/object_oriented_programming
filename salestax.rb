class Product #This is a factory, has two things data (state - which we give it) and behaviour. Tell don't ask principle.

  def initialize (quantity, name, price)       #Need to set up and initialize the variables to store info
      @quantity = quantity                     #Don't name a method after a variable
      @a_name = name                           #Anything that needs the object needs are set up here
      @price = price                           #Without the @ it can only be accessed in the method (scope)
  end

  def sales_tax
    subtotal * tax_rate
  end

  def total_price
   subtotal + sales_tax
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
    super + 0.05                             #Import tax rate runs the parent method of the same name and adds 5%
  end
end

class Exempt < Product
  def tax_rate
    0
  end
end

class Importedexempt < Exempt
  def tax_rate
    super + 0.05
  end
end

product = Product.new(1, "book", 12.49)
#Need to give the factory some information, like the colour of the car you want made,
#putting the information in the order of the question and also the method. Need to initialize for three vars

puts product.tax_rate

puts product.sales_tax                      #You could also do these outside the class but it will be messy!
puts product.total_price                    #START HERE by making these your test - what you want to be able to run so code it!

imported = Imported.new(1, "imported book", 24.95)

puts imported.tax_rate                      #Select one, then hit command D to change further ones

puts imported.sales_tax                     
puts imported.total_price    

exempt = Exempt.new(1, "chocolatebar", 0.85)

puts exempt.tax_rate                      

puts exempt.sales_tax                     
puts exempt.total_price    

importedexempt = Importedexempt.new(1, "chocolatebar", 0.85)

puts importedexempt.tax_rate                     

puts importedexempt.sales_tax                     
puts importedexempt.total_price    


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