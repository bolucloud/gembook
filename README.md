Gembook
A terminal-based contact book application that allows users to store, search, delete, and update personal contact information.

Running the Application
Clone the repository:

git clone https://github.com/bolucloud/gembook.git  
cd gembook

Run the program in your terminal:

ruby contact_book.rb

This will launch the interactive menu where you can add, edit, delete, search, sort, and export/import contacts.

Running the Test Suite
To run the tests:

rspec

If you do not have RSpec installed:

gem install rspec

File Storage
The application stores contact data in contacts.json.
Tests use contacts-test.json to avoid modifying real data.

Requirements
Ruby 3.x recommended
No external dependencies beyond the Ruby standard library
