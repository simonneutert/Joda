# frozen_string_literal: true

# connect to an in-memory database
#
require 'jdbc/h2'
Jdbc::H2.load_driver
DB = Sequel.connect('jdbc:h2:mem:', single_threaded: true)

# want to use postgres?
# switch gems in the Gemfile
#
# require 'jdbc/postgres'
# Jdbc::Postgres.load_driver
# DB = Sequel.connect('jdbc:postgresql://localhost/joda?user=postgres&password=postgres')

# create an items table
begin
  DB.create_table :items do
    primary_key :id
    String :name, unique: true, null: false
    Float :price, null: false
  end

  # create a dataset from the items table
  items = DB[:items]

  # populate the table
  items.insert(name: 'abc', price: rand * 100)
  items.insert(name: 'def', price: rand * 100)
  items.insert(name: 'ghi', price: rand * 100)

  # print out the number of records
  # puts "Item count: #{items.count}"

  # print out the average price
  # puts "The average price is: #{items.avg(:price)}"
rescue StandardError => e
  if e.message.include?('already exists')
    puts 'no need to create a table, never mind 🤭'
  else
    raise e
  end
end
