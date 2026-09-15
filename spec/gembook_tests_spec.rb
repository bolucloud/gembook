require_relative "../contact_book"

describe 'Add a contact' do
    describe '#add_contact' do
        it 'adds a new contact to gembook' do
            contact_book_test_file = File.read("spec/contacts-test.json")
            contact_book_test = JSON.parse(contact_book_test_file)
            initial_count = contact_book_test.length
            new_contact = {
                "id" => next_id(contact_book_test),
                "name" => "Jack Black",
                "phone" => { "mobile" => "987-654-3210" },
                "email" => "jack.black@outlook.com"
            }
            contact_book_test << new_contact
            save_contact_book(contact_book_test)
            expect(contact_book_test.length).to eq(initial_count + 1)
        end
    end
end