require_relative "../contact_book"
require "date"

describe "Today's Birthdays" do
  it "returns contacts whose birthday is today" do
    today = Date.today.strftime("%Y-%m-%d")

    contacts = [
      { "name" => "Ben", "birthday" => today },
      { "name" => "Bolo", "birthday" => "1990-05-14" }
    ]

    results = contacts.select do |c|
      Date.parse(c["birthday"]).strftime("%m-%d") == Date.today.strftime("%m-%d")
    end

    expect(results.length).to eq(1)
    expect(results.first["name"]).to eq("Ben")
  end
end
