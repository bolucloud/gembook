require_relative "../contact_book"

describe '#add_contact' do
  it 'adds a new contact to gembook' do
    # Start with a clean, isolated contact book
    contact_book = []

    # Minimal valid contact input
    new_contact = {
      "name" => "Jack Black",
      "phone" => { 
        "mobile" => "987-654-3210",
        "home" => nil,
        "work" => nil
      },
      "email" => "jack.black@outlook.com"
    }

    # Call the actual method you're testing
    updated_book = add_contact(contact_book, new_contact)

    # Expectations
    expect(updated_book.length).to eq(1)
    expect(updated_book.first["name"]).to eq("Jack Black")
    expect(updated_book.first["id"]).to eq(1)
  end
end
