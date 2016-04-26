require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
require 'date'
puts Date.today

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price
  
  #--------------------------------------------------------------  
  products_hash["items"].each do |items|
    num = 0
    total_amount = 0.0
  
    items["purchases"].each do |item|
      puts items["title"]
      puts item["full-price"]
    
      num = num + 1
    end
    
    total_amount = items["purchases"].inject(0) { |total, each_one| total + each_one["price"] }
  
    average_price = total_amount/num
  
    puts "Total number purchased : " + num.to_s
    puts "Total amount sold : " + total_amount.to_s
    puts "Average price : " + average_price.to_s
    puts "Discount : $" + ( items["full-price"].to_f - average_price ).round(3).to_s
    puts "----------"
  end
  #--------------------------------------------------------------
  
  
	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined
  
  brand_name = products_hash["items"].map { |items| items["brand"] }.uniq
  
  brand_name.each do |name|
    puts "Brand : " + name
    
    by_brand = products_hash["items"].select { |it| it["brand"] == name }
    
    stock = by_brand.inject(0) { |total, it| total + it["stock"] } 
    puts "Stock : " + stock.to_s
    
    sold_num = 0
    total_revenue = 0.0
    by_brand.each do |its|  
    
      sold_num += its["purchases"].inject(0) { |total_num, it| total_num + 1 }
      total_revenue += its["purchases"].inject(0) { |total_rvn, it| total_rvn + its["full-price"].to_f }
    end
    
    #puts "Sold_Num : " + sold_num.to_s
    puts "Avarage Revenue : " + (total_revenue/sold_num).round(2).to_s
    puts "Total Revenue : " + total_revenue.round(2).to_s
    
    #puts by_brand
    puts "--------------"
  end
  
#  puts lego_items.length
  
  
  
  