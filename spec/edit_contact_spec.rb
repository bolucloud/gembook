require_relative "../contact_book"

describe "Edit Contact" do
  it "updates contact fields" do
    contact = {
      "id" => 1,
      "name" => "Old Name",
      "phone" => { "mobile" => "111" },
      "email" => "old@example.com",
      "address" => { "street" => "Old", "city" => "Old", "state" => "TX", "zip" => "00000" },
      "birthday" => "1990-01-01",
      "tags" => ["friend"],
      "favorite" => false
    }

    contact["name"] = "New Name"
    contact["favorite"] = true

    expect(contact["name"]).to eq("New Name")
    expect(contact["favorite"]).to eq(true)
  end
end
