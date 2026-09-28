require "json"
require "time"

FILE = "contacts.json"

nfl_players = [
  { name: "Patrick Mahomes", birthday: "1995-01-15" },
  { name: "Josh Allen", birthday: "1996-02-07" },
  { name: "Jalen Hurts", birthday: "1998-03-15" },
  { name: "Christian McCaffrey", birthday: "1996-04-07" },
  { name: "Bijan Robinson", birthday: "2002-05-22" },
  { name: "Justin Jefferson", birthday: "1999-06-16" },
  { name: "CeeDee Lamb", birthday: "1999-07-08" },
  { name: "Tyreek Hill", birthday: "1994-08-01" },
  { name: "Amon-Ra St. Brown", birthday: "1999-09-24" },
  { name: "Saquon Barkley", birthday: "1997-10-09" },
  { name: "George Kittle", birthday: "1993-11-09" },
  { name: "Travis Kelce", birthday: "1989-12-05" }
]

def next_id(contact_book)
  return 1 if contact_book.empty?
  contact_book.map { |c| c["id"] }.max + 1
end

contact_book = File.exist?(FILE) ? JSON.parse(File.read(FILE)) : []

nfl_players.each do |player|
  new_contact = {
    "id" => next_id(contact_book),
    "name" => player[:name],
    "phone" => {
      "mobile" => "555-#{rand(100..999)}-#{rand(1000..9999)}",
      "home" => nil,
      "work" => nil
    },
    "email" => "#{player[:name].downcase.gsub(" ", ".")}@nfl.com",
    "address" => {
      "street" => "#{rand(100..999)} NFL Drive",
      "city" => "San Antonio",
      "state" => "TX",
      "zip" => "782#{rand(10..99)}"
    },
    "birthday" => player[:birthday],
    "tags" => ["NFL", "Player", "Favorite"],
    "notes" => "Auto-generated NFL contact for demo.",
    "favorite" => false,
    "created_at" => Time.now.iso8601,
    "updated_at" => Time.now.iso8601
  }

  contact_book << new_contact
end

File.write(FILE, JSON.pretty_generate(contact_book))

puts "NFL contacts added successfully!"
