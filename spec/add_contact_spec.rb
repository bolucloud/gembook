require_relative "../contact_book"

describe "Add Contact" do
  it "adds a new contact to the contact book" do
    contact_book = []
    new_contact = {
      "id" => next_id(contact_book),
      "name" => "Jack Black",
      "phone" => { "mobile" => "987-654-3210" },
      "email" => "jack.black@outlook.com",
      "address" => { "street" => "", "city" => "", "state" => "", "zip" => "" },
      "birthday" => "1990-01-01",
      "tags" => [],
      "favorite" => false
    }

    contact_book << new_contact
    expect(contact_book.length).to eq(1)
    expect(contact_book.first["name"]).to eq("Jack Black")
  end
end
