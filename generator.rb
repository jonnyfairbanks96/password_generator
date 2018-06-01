#!/usr/bin/env ruby
# frozen_string_literal: true

require "optparse"

options = {
  count: nil,
  length: nil
}

OptionParser.new do |opts|
  opts.banner = "Password Generator 1.0"

  opts.on("-c", "--count 1", "How many paswords do you need?") do |count|
    options[:count] = count
  end

  opts.on("-l", "--length 8", "Length of your password") do |length|
    options[:length] = length
  end

  opts.on("-h", "--help", "Display Help") do
    puts opts
    exit
  end
end.parse!

def generate_password(size)
  charset = %w{
  1 2 3 4 5 6 7 8 9 0
  a b c d e f g h i j k l m n o p q r s t u v w x y z
  A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
  ! @ # $ % ^ & * + ? , .
}

  new_password = (0...size).map{ charset.to_a[rand(charset.size)] }.join
  new_password
end

if options[:count] == nil
      print 'How many passwords do you need? '
    options[:count] = gets.chomp
end

if options[:length] == nil
      print 'How long do you need your password? '
    options[:length] = gets.chomp
end

puts "\n\nPassword is #{generate_password((options[:length]).to_i)}\n\n"
