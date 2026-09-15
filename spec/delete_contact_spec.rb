require_relative "../contact_book"

describe "Delete Contact" do
  it "removes a contact from the list" do
    contacts = [
      { "id" => 1, "name" => "A" },
      { "id" => 2, "name" => "B" }
    ]

    deleted = contacts.delete_at(0)

    expect(deleted["name"]).to eq("A")
    expect(contacts.length).to eq(1)
  end
end
