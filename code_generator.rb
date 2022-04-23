require 'securerandom'

time = Time.now
time_format = time.strftime "%Y-%m-%d_%H:%M:%S"

print 'How many codes do you want to generate?: '
code_quantity = gets.strip

print 'How many characters should the code be?: '
code_len = gets.strip

file_format = 'xml'

quantity = Integer(code_quantity) rescue false
length = Integer(code_len) rescue false

if (quantity && length) && (quantity > 0 && length > 0)
  quantity.times do |n|
    if n >= quantity
      break
    else
      File.open("code_generator_#{time_format}.#{file_format}", 'a+') { |file| file.write("#{SecureRandom.alphanumeric(length)} ") }
    end
  end
else
  puts "Error! Please Enter Positive Numbers Only!"
  exit
end

puts "File has been successfully created. File format: '#{file_format}'. Total generated codes is: #{code_quantity}."

