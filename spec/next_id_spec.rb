require_relative "../contact_book"

describe "next_id" do
  it "returns 1 for empty contact book" do
    expect(next_id([])).to eq(1)
  end

  it "returns max id + 1" do
    contacts = [
      { "id" => 1 },
      { "id" => 5 },
      { "id" => 3 }
    ]
    expect(next_id(contacts)).to eq(6)
  end
end
