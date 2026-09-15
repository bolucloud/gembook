require_relative "../contact_book"

describe "Search Contacts" do
  it "finds contacts by name" do
    contacts = [
      { "name" => "Benjamin", "phone" => { "mobile" => "111" }, "email" => "a@a.com",
        "address" => { "city" => "San Antonio" }, "tags" => ["friend"] }
    ]

    term = "ben"
    results = contacts.select { |c| c["name"].downcase.include?(term) }

    expect(results.length).to eq(1)
  end
end
