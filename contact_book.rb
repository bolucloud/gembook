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

def age_from_birthday(bday)
    return nil if bday.nil? || bday.empty?
    dob = Date.parse(bday)
    now = Date.today
    age = now.year - dob.year
    age -= 1 if Date.new(now.year, dob.month, dob.day) > now
    age
end

def upcoming_birthdays(contact_book)
    today = Date.today
    next_30 = today + 30

    contact_book.select do |c|
        next unless c["birthday"] && !c["birthday"].empty?
        bday = Date.parse(c["birthday"])
        upcoming = Date.new(today.year, bday.month, bday.day)

        # If birthday already passed this year, check next year
        upcoming = Date.new(today.year + 1, bday.month, bday.day) if upcoming < today

        upcoming <= next_30
    end
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
    puts "9. Upcoming birthdays"
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
            age = age_from_birthday(contact['birthday'])
            puts "   Age: #{age}" if age
            puts "   Tags: #{contact['tags'].join(', ')}"
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
        print "Enter search term (name, phone, email, city, tag, birthday): "
        term = gets.chomp.downcase

        results = contact_book.select do |contact|
            contact['name'].downcase.include?(term) ||
            contact['phone']['mobile'].downcase.include?(term) ||
            contact['email'].downcase.include?(term) ||
            contact['address']['city'].downcase.include?(term) ||
            contact['tags'].any? { |t| t.downcase.include?(term) } ||
            contact['birthday'].downcase.include?(term)
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
                puts "   Birthday: #{contact['birthday']}"
                age = age_from_birthday(contact['birthday'])
                puts "   Age: #{age}" if age
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
        puts "Contacts exported to contacts_export.csv!"

    elsif selection == 7
        if File.exist?("contacts_import.csv")
            CSV.foreach("contacts_import.csv", headers: true) do |row|
                contact_book << {
                    "id" => next_id(contact_book),
                    "name" => row["name"],
                    "phone" => {
                        "mobile" => row["mobile"],
                        "home" => nil,
                        "work" => nil
                    },
                    "email" => row["email"],
                    "address" => {
                        "street" => row["street"],
                        "city" => row["city"],
                        "state" => row["state"],
                        "zip" => row["zip"]
                    },
                    "birthday" => row["birthday"],
                    "tags" => row["tags"].split(";"),
                    "favorite" => false,
                    "created_at" => Time.now.iso8601,
                    "updated_at" => Time.now.iso8601
                }
            end

            save_contact_book(contact_book)
            puts "Contacts imported successfully!"
        else
            puts "contacts_import.csv not found!"
        end

    elsif selection == 8
        puts ""
        puts "Sort contacts by:"
        puts "1. Name (A–Z)"
        puts "2. City (A–Z)"
        puts "3. Birthday (oldest → youngest)"
        print "Choose: "
        sort_choice = gets.chomp.to_i

        case sort_choice
        when 1
            contact_book.sort_by! { |c| c["name"].downcase }
            puts "Sorted by name!"
        when 2
            contact_book.sort_by! { |c| c["address"]["city"].downcase }
            puts "Sorted by city!"
        when 3
            contact_book.sort_by! { |c| Date.parse(c["birthday"]) }
            puts "Sorted by birthday!"
        else
            puts "Invalid sort option."
        end

        save_contact_book(contact_book)

    elsif selection == 9
        puts "Upcoming birthdays (next 30 days):"
        upcoming = upcoming_birthdays(contact_book)

        if upcoming.empty?
            puts "No upcoming birthdays."
        else
            upcoming.each do |c|
                bday = Date.parse(c["birthday"])
                next_bday = Date.new(Date.today.year, bday.month, bday.day)
                next_bday = Date.new(Date.today.year + 1, bday.month, bday.day) if next_bday < Date.today

                puts "#{c['name']} — #{c['birthday']} (Next: #{next_bday})"
            end
        end

    elsif selection == 0
        puts "Leaving Gembooks. Goodbye!"
        break

    else
        puts "Invalid selection. Please select another option"
    end
end
