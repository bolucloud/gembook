require "json"

FILE = "contacts.json"

def load_contact_book
    if File.exist?(FILE)
        contact_book_file = File.read(FILE)
        JSON.parse(contact_book_file)
    else
        []
    end
end

def save_contact_book(contact_book_file)
    File.write(FILE, JSON.pretty_generate(contact_book_file))
end

contact_book = load_contact_book

loop do
    puts "Gembooks Menu"
    puts "1. List all contacts"
    puts "0. Exit"

    print "Make a selection: "
    selection = gets.chomp.to_i #forcing it to be an integer

    if selection == 1
        puts "Showing all contacts: "
        contact_book.each_with_index do |contact, index|
            puts "#{index + 1}. Name: #{contact['name']}, Email: #{contact['email']}, Phone: #{contact['phone']}"
        end

    elsif selection == 0
        puts "Leaving Gembooks. Goodbye!"
        break
    
    else
        puts "Invalid selection. Please select another option"
    end
end