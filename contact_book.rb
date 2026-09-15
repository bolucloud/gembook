require "json"
require "time"
require "csv"
require "date"

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

def next_id(contact_book)
    return 1 if contact_book.empty?
    contact_book.map { |c| c["id"] }.max + 1
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
    puts "6. Export contacts to CSV"
    puts "7. Import contacts from CSV"
    puts "8. Sort contacts"
    puts "9. List favorite contacts"
    puts "10. Show today's birthdays"
    puts "0. Exit"
    puts ""
    print "Make a selection: "
    puts ""

    selection = gets.chomp.to_i

    if selection == 1
        puts "Showing all contacts: "
        contact_book.each_with_index do |contact, index|
            puts "#{index + 1}. #{contact['name']} (ID: #{contact['id']})"
            puts "   Mobile: #{contact['phone']['mobile']}"
            puts "   Email: #{contact['email']}"
            puts "   Address: #{contact['address']['street']}, #{contact['address']['city']}, #{contact['address']['state']} #{contact['address']['zip']}"
            puts "   Birthday: #{contact['birthday']}"
            puts "   Tags: #{contact['tags'].join(', ')}"
            puts "   Favorite: #{contact['favorite'] ? 'Yes' : 'No'}"
            puts ""
        end

    elsif selection == 2
        puts ""
        print "Enter name: "
        name = gets.chomp

        print "Enter mobile phone: "
        mobile = gets.chomp

        print "Enter email: "
        email = gets.chomp

        print "Street address: "
        street = gets.chomp

        print "City: "
        city = gets.chomp

        print "State: "
        state = gets.chomp

        print "ZIP: "
        zip = gets.chomp

        print "Birthday (YYYY-MM-DD): "
        birthday = gets.chomp

        print "Tags (comma separated): "
        tags = gets.chomp.split(",").map(&:strip)

        new_contact = {
            "id" => next_id(contact_book),
            "name" => name,
            "phone" => {
                "mobile" => mobile,
                "home" => nil,
                "work" => nil
            },
            "email" => email,
            "address" => {
                "street" => street,
                "city" => city,
                "state" => state,
                "zip" => zip
            },
            "birthday" => birthday,
            "tags" => tags,
            "favorite" => false,
            "created_at" => Time.now.iso8601,
            "updated_at" => Time.now.iso8601
        }

        contact_book << new_contact
        save_contact_book(contact_book)

        puts ""
        puts "New contact added successfully!!"

    elsif selection == 3
        puts "Which contact would you like to edit?"
        contact_book.each_with_index do |contact, index|
            puts "#{index + 1}. #{contact['name']} (ID: #{contact['id']})"
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

            print "New mobile (leave blank to keep '#{contact['phone']['mobile']}'): "
            new_mobile = gets.chomp
            contact['phone']['mobile'] = new_mobile unless new_mobile.empty?

            print "New email (leave blank to keep '#{contact['email']}'): "
            new_email = gets.chomp
            contact['email'] = new_email unless new_email.empty?

            print "New street (leave blank to keep '#{contact['address']['street']}'): "
            new_street = gets.chomp
            contact['address']['street'] = new_street unless new_street.empty?

            print "New city (leave blank to keep '#{contact['address']['city']}'): "
            new_city = gets.chomp
            contact['address']['city'] = new_city unless new_city.empty?

            print "New state (leave blank to keep '#{contact['address']['state']}'): "
            new_state = gets.chomp
            contact['address']['state'] = new_state unless new_state.empty?

            print "New ZIP (leave blank to keep '#{contact['address']['zip']}'): "
            new_zip = gets.chomp
            contact['address']['zip'] = new_zip unless new_zip.empty?

            print "New birthday (leave blank to keep '#{contact['birthday']}'): "
            new_bday = gets.chomp
            contact['birthday'] = new_bday unless new_bday.empty?

            print "New tags (comma separated, leave blank to keep current): "
            new_tags = gets.chomp
            contact['tags'] = new_tags.split(",").map(&:strip) unless new_tags.empty?

            print "Mark as favorite? (y/n, leave blank to keep current): "
            fav = gets.chomp.downcase
            contact["favorite"] = true if fav == "y"
            contact["favorite"] = false if fav == "n"

            contact["updated_at"] = Time.now.iso8601

            save_contact_book(contact_book)
            puts "Contact updated!"
        end

    elsif selection == 4
        puts "Which contact would you like to delete?"
        contact_book.each_with_index do |contact, index|
            puts "#{index + 1}. #{contact['name']} (ID: #{contact['id']})"
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
        print "Enter search term (name, phone, email, city, tag): "
        term = gets.chomp.downcase

        results = contact_book.select do |contact|
            contact['name'].downcase.include?(term) ||
            contact['phone']['mobile'].downcase.include?(term) ||
            contact['email'].downcase.include?(term) ||
            contact['address']['city'].downcase.include?(term) ||
            contact['tags'].any? { |t| t.downcase.include?(term) }
        end

        if results.empty?
            puts "No contacts found."
        else
            puts "Search results:"
            results.each_with_index do |contact, index|
                puts "#{index + 1}. #{contact['name']} (ID: #{contact['id']})"
                puts "   Mobile: #{contact['phone']['mobile']}"
                puts "   Email: #{contact['email']}"
                puts "   City: #{contact['address']['city']}"
                puts "   Tags: #{contact['tags'].join(', ')}"
                puts ""
            end
        end

    elsif selection == 6
        CSV.open("contacts_export.csv", "w") do |csv|
            csv << ["id", "name", "mobile", "email", "street", "city", "state", "zip", "birthday", "tags"]
            contact_book.each do |c|
                csv << [
                    c["id"],
                    c["name"],
                    c["phone"]["mobile"],
                    c["email"],
                    c["address"]["street"],
                    c["address"]["city"],
                    c["address"]["state"],
                    c["address"]["zip"],
                    c["birthday"],
                    c["tags"].join(";")
                ]
            end
        end
        puts "Contacts exported
