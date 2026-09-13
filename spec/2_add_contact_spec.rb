require_relative "../contact_book"

describe 'Add a contact' do
    describe '#add_contact' do
        let(:contact_book_test_file) { "spec/contacts-test.json" }
        let(:contacts) { [] }
        before do
            FILE.replace("contacts.json", contact_book_test_file)
        end
        
        it 'adds a new contact to gembook' do
                contact_book = load_contact_book
                initial_count = contact_book.length

                new_contact = {
                    "id" => next_id(contact_book),
                    "name" => "Jack Black",
                    "phone" => { "mobile" => "987-654-3210" },
                    "email" => "jack.black@outlook.com"
                }
                add_contact(contact_book, new_contact)
                expect(contact_book.length).to eq(initial_count + 1)
            end
        end
end