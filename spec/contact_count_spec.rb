require_relative "../contact_book"

describe "Contact Count" do
    it "returns the correct number of contacts in the gembook" do
        contact_book = [
            { "id" => 1, "name" => "Ben" },
            { "id" => 2, "name" => "Bolu" }
        ]
        count_message = set_contact_count(contact_book.length)
        expect(count_message).to eq("2 contacts")
    end
end
