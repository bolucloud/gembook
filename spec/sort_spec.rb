require_relative "../contact_book"
require "date"

describe "Sort Contacts" do
  it "sorts by name" do
    contacts = [
      { "name" => "Charlie" },
      { "name" => "Alice" }
    ]

    sorted = contacts.sort_by { |c| c["name"].downcase }
    expect(sorted.first["name"]).to eq("Alice")
  end
end
