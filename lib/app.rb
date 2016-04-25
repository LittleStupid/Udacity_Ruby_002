require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
puts "2016-04-25"

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
      puts item["price"]
    
      num = num + 1
    
      total_amount += item["price"]
    end
  
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
  
  lego_stock = 0
  nano_stock = 0
  
  lego_total_revenue = 0.0
  nano_total_revenue = 0.0
  
  lego_sold_num = 0
  nano_sold_num = 0
  
  products_hash["items"].each do |items|
    if( items["brand"] == "LEGO" )
       lego_stock += items["stock"]
      
      items["purchases"].each do |item|
        lego_sold_num += 1
        lego_total_revenue += item["price"]
      end
    
    else
    
      nano_stock += items["stock"]
      
      items["purchases"].each do |item|
        nano_sold_num += 1
        nano_total_revenue += item["price"]
      end
    end
    
  end
  
  puts "LEGO"
  puts "Num in Stock : " + lego_stock.to_s
  puts "Average Price : " + (lego_total_revenue/lego_sold_num).round(2).to_s
  puts "Revenue : " + lego_total_revenue.round(2).to_s
  
  puts "-----------------------"
  
  puts "Nano Blocks"
  puts "Num in Stock : " + nano_stock.to_s
  puts "Average Price : " + (nano_total_revenue/nano_sold_num).round(2).to_s
  puts "Revenue : " + nano_total_revenue.round(2).to_s  
  
  
  
  
  