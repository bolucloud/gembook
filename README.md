Gembooks – Ruby CLI Contact Manager
Gembooks is a Ruby-based command-line contact manager designed to store, organize, search, sort, and export contact information. It uses JSON for persistent storage, supports CSV import/export, and includes birthday reminders and full RSpec test coverage.

This project reflects real debugging, refactoring, and testing experience — including handling malformed data, fixing sorting logic, sanitizing input, and validating the entire system with automated tests.

Features
Contact Management
Add new contacts

Edit existing contacts

Delete contacts

Search by name, phone, email, address, tags, notes, or birthday

Sorting
Sort contacts by Name (A–Z)

Sort contacts by City (A–Z)

Sort contacts by Birthday (oldest → youngest)

Safe handling of missing or malformed fields

Data Storage
Contacts stored in contacts.json

Auto-updates timestamps (created_at, updated_at)

CSV Support
Export contacts to contacts_export.csv

Import contacts from contacts_import.csv

Handles missing fields safely

Compatible with GitHub file previews

Birthday Tools
Today’s birthdays

Birthdays this month

Upcoming birthdays (next 30 days)

RSpec Tested
All core functions validated with:

Code
13 examples, 0 failures
NFL Contact Dataset (Demo)
This project includes a demo dataset of NFL players to test:

Sorting

Searching

CSV export

Address handling

Birthday reminders

The dataset helped uncover real-world issues like malformed addresses, nil values, and inconsistent fields — all of which were fixed during refactoring.

Project Structure
Code
gembooks/
│
├── contact_book.rb        # Main CLI application
├── contacts.json          # Persistent contact storage
├── contacts_export.csv    # Generated CSV file (optional)
├── spec/                  # RSpec tests
│   ├── contact_book_spec.rb
│   └── other specs...
└── README.md              # Project documentation
Installation
Requirements
Ruby 3.x recommended

RSpec installed (gem install rspec)

Clone the repository
Code
git clone https://github.com/YOURNAME/gembooks.git
cd gembooks
Running the Application
Start the CLI:

Code
ruby contact_book.rb
You’ll see:

Code
1. List all contacts
2. Add a new contact
3. Edit a contact
4. Delete a contact
5. Search for a contact
6. Export contacts to CSV
7. Import contacts from CSV
8. Sort contacts
9. Upcoming birthdays
0. Exit
Running Tests
Execute the full RSpec suite:

Code
rspec
Expected output:

Code
13 examples, 0 failures
This confirms the application is stable and all core functions behave correctly.

CSV Export Example
Running Option 6 generates:

Code
contacts_export.csv
GitHub will display this file directly, making it easy to showcase your data.

Lessons Learned
This project strengthened skills in:

Ruby CLI development

JSON and CSV data handling

Defensive programming (nil checks, malformed data)

Refactoring large files

Writing safe sorting logic

Automated testing with RSpec

Debugging real-world issues

Version control with Git & GitHub

🌱 Future Improvements
Favorite/starred contacts

Colorized terminal output

GUI version (Tk or Shoes)

Web API (Sinatra or Rails)

Database backend (SQLite/PostgreSQL)
