require_relative "../contact_book"
require "json"

describe "Load and Save Contact Book" do
  it "loads an empty array when file does not exist" do
    allow(File).to receive(:exist?).and_return(false)
    expect(load_contact_book).to eq([])
  end

  it "saves and loads contacts correctly" do
    test_data = [
      { "id" => 1, "name" => "Test User", "phone" => { "mobile" => "123" } }
    ]

    allow(File).to receive(:write)
    allow(File).to receive(:read).and_return(JSON.pretty_generate(test_data))
    allow(File).to receive(:exist?).and_return(true)

    save_contact_book(test_data)
    loaded = load_contact_book

    expect(loaded.first["name"]).to eq("Test User")
  end
end
