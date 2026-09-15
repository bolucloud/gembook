require_relative "../contact_book"

describe "Favorites Feature" do
  it "returns only favorite contacts" do
    contacts = [
      { "name" => "Ben", "favorite" => true },
      { "name" => "Bolo", "favorite" => false }
    ]

    favorites = contacts.select { |c| c["favorite"] == true }

    expect(favorites.length).to eq(1)
    expect(favorites.first["name"]).to eq("Ben")
  end
end
