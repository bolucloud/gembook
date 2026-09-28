# Gembook

Gembooks is a Ruby-based command-line contact manager designed to store, organize, search, sort, and export contact information. It uses JSON for persistent storage, supports CSV import/export, and includes birthday reminders and full RSpec test coverage.

This project reflects real debugging, refactoring, and testing experience — including handling malformed data, fixing sorting logic, sanitizing input, and validating the entire system with automated tests.

## Table of Contents
- [Project structure](#project-structure)
- [Installation and setup](#installation)
- [Running the app](#running-the-app)
- [Running tests and coverage report](#running-the-tests)
- [Features](#features)
- [Limitations](#limitations)
- [Team Members](#team-members)

## Project Structure
```
gembooks/
├── docs/                       # documentation
│   ├── backlog.md
│   └── pairing_log.md
│   ├── planning.md
│   └── retrospective.md
│   ├── user_stories.md
├── scripts/                    # contact seeding script
│   ├── contacts.json
│   └── populate_contacts.rb 
├── spec/                       # RSpec tests
│   ├── contact_book_spec.rb
│   └── other specs...
├── contact_book.rb             # Main CLI application
├── contacts.json               # Persistent contact storage
├── contacts_export.csv         # Generated CSV file (optional)
└── README.md                   # Project documentation
```

## Installation
### Requirements
- **Ruby** 3.2 or higher
- **RSpec** 
- **Command line Terminal**

### Running the App
Clone the github repository at https://github.com/bolucloud/gembook

```bash
git clone https://github.com/bolucloud/gembook
cd gembook
```

Once in the gembook folder, run
```bash
ruby contact_book.rb
```

You'll see the main menu with today's birthday reminder popping up if a there's a birthday today.
```
++++++++++++++++++++++++++
 🎂 Today's Birthdays! 🎂 
++++++++++++++++++++++++++
Jone Steele — 1990-09-27
++++++++++++++++++++++++++

----------------------------
Welcome to Gembooks!
PLEASE SELECT AN OPTION:
----------------------------

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

Make a selection: 
```
Use the numbers to select an option to continue using the app.

### Running the Tests
RSpec needs to be installed to run the tests. Do this by running command
```bash
gem install rspec
```
After installation, can run the tests in the spec folder with the command
```bash
rspec spec/<<file name>>
```
so for example
```bash
rspec spec/add_contact_spec.rb
```
or 
```bash
rspec spec/search_spec.rb
```
Expected output:

Code
13 examples, 0 failures
This confirms the application is stable and all core functions behave correctly.

## Features
- **List all contacts** - list all contacts in the gembook
- **Add contact** - add name, address, phone number, birthday, and notes of a new contact
- **Edit contact** - update any field for an existing contact
- **Delete contact** - delete a contact from gembook
- **Search for contact** - search contacts by any attribute (name, phone, email, address, tags, notes, or birthday)
- **Export contacts** - export csv of entire contact list
- **Import contacts** - import csv consisting of contacts
- **Sort contacts** - sort list of contacts aphabetically by name or city
- **Upcoming birthdays** - show contacts with upcoming birthdays in the next 30 days
- **Birthday reminders** - see today's birthdays on app launch
- **Data storage** - data stored in a single JSON file
- **Timestamps** - dynamically updating time metadata such as created_at and updated_at

## Limitations
- Unable to add more than 1 phone number
- Unable to add more than a primary address

## Team Members
- Benjamin Cerna
- Bolu Owolana