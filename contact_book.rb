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
