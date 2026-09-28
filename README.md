# Gembook

Gembook is a terminal-based address book written in Ruby. This application stores names, primary addresses, phone numbers, emails, birthdays, and notes of your list of contacts, all in a local JSON file you own. The application also allows for exporting of your contact data for backup and importing contact data for restoring backups.

## Table of Contents
- [Installation and setup](#installation)
- Running the app
- Running tests and coverage report
- Usage
- Data Storage
- Testing 
- Project Structure
- Troubleshooting
- [Features](#features)
- [Limitations](#limitations)
- [Team Members](#team-members)

--
### Installation
##### Requirements
- **Ruby** 3.2 or higher
- **RSpec** 
- **Command line Terminal**

##### Running the App
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

##### Running the Tests
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

--
### Features
- **List all contacts** - list all contacts in the gembook
- **Add contact** - add name, address, phone number, birthday, and notes of a new contact
- **Edit contact** - update any field for an existing contact
- **Delete contact** - delete a contact from gembook
- **Search for contact** - search contacts by any attribute
- **Export contacts** - export csv of entire contact list
- **Import contacts** - import csv consisting of contacts
- **Sort contacts** - sort list of contacts aphabetically by name or city
- **Upcoming birthdays** - show contacts with upcoming birthdays in the next 30 days
- **Birthday reminders** - see today's birthdays on app launch
- **Local storage** - data stored in a single JSON file

--
### Limitations
- Unable to add more than 1 phone number
- Unable to add more than a primary address

--
### Team Members
- Benjamin Cerna
- Bolu Owolana