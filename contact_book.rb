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
    puts ""
    puts "----------------------------"
    puts "Welcome to Gembooks!"
    puts "PLEASE SELECT AN OPTION: "
    puts "----------------------------"
    puts ""
    puts "1. List all contacts"
    puts "2. Add a new contact"
    puts "3. Edit a contact"
    puts "4. Delete a contact"
    puts "5. Search for a contact"
    puts "0. Exit"
    puts ""
    print "Make a selection: "
    puts ""

    selection = gets.chomp.to_i

    if selection == 1
        puts "Showing all contacts: "
        contact_book.each_with_index do |contact, index|
            puts "#{index + 1}. Name: #{contact['name']}, Phone: #{contact['phone']}, Email: #{contact['email']}"
        end

    elsif selection == 2
        puts ""
        print "Enter name: "
        name = gets.chomp
        print "Enter phone number: "
        phone = gets.chomp
        print "Enter email: "
        email = gets.chomp

        contact_book << { "name" => name, "phone" => phone, "email" => email }
        save_contact_book(contact_book)

        puts ""
        puts "New contact added successfully!!"

    elsif selection == 3
        puts "Which contact would you like to edit?"
        contact_book.each_with_index do |contact, index|
            puts "#{index + 1}. #{contact['name']}"
        end

        print "Enter number: "
        idx = gets.chomp.to_i - 1

        if idx < 0 || idx >= contact_book.length
            puts "Invalid selection."
        else
            contact = contact_book[idx]

            print "New name (leave blank to keep '#{contact['name']}'): "
            new_name = gets.chomp
            contact['name'] = new_name unless new_name.empty?

            print "New phone (leave blank to keep '#{contact['phone']}'): "
            new_phone = gets.chomp
            contact['phone'] = new_phone unless new_phone.empty?

            print "New email (leave blank to keep '#{contact['email']}'): "
            new_email = gets.chomp
            contact['email'] = new_email unless new_email.empty?

            save_contact_book(contact_book)
            puts "Contact updated!"
        end

    elsif selection == 4
        puts "Which contact would you like to delete?"
        contact_book.each_with_index do |contact, index|
            puts "#{index + 1}. #{contact['name']}"
        end

        print "Enter number: "
        idx = gets.chomp.to_i - 1

        if idx < 0 || idx >= contact_book.length
            puts "Invalid selection."
        else
            deleted = contact_book.delete_at(idx)
            save_contact_book(contact_book)
            puts "Deleted contact: #{deleted['name']}"
        end

    elsif selection == 5
        print "Enter search term (name, phone, or email): "
        term = gets.chomp.downcase

        results = contact_book.select do |contact|
            contact['name'].downcase.include?(term) ||
            contact['phone'].downcase.include?(term) ||
            contact['email'].downcase.include?(term)
        end

        if results.empty?
            puts "No contacts found."
        else
            puts "Search results:"
            results.each_with_index do |contact, index|
                puts "#{index + 1}. Name: #{contact['name']}, Phone: #{contact['phone']}, Email: #{contact['email']}"
            end
        end

    elsif selection == 0
        puts "Leaving Gembooks. Goodbye!"
        break

    else
        puts "Invalid selection. Please select another option"
    end
end
