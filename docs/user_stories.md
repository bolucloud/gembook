# User Stories

### 1  
**Title**: 
Save Contacts
**Description:**
As a gembooks user, I want to save my inputted contacts so that I can retrieve them when needed
**Acceptance Criteria:**
User can save contacts to location on device 

---

### 2 
**Title**: 
Gembooks launch menu
**Description:**
As a gembooks user, I want to see a menu when I start the application so that I can do different things with the application.
**Acceptance Criteria:**
User sees an interactive menu when the application is launched.

---

### 3
**Title**: 
Add a contact
**Description:**
As a gembooks user, I want to add a new contact to the application so that I can retrieve it later.
**Acceptance Criteria:**
User can add and save a new contact in the application

---

### 4
**Title**: 
Delete a contact
**Description:**
As a gembooks user, I want to delete a contact from the application so that I can keep my contacts list manageable.
**Acceptance Criteria:**
User can delete contact from the application

---

### 5
**Title**: 
Edit a contact
**Description:**
As a gembooks user, I want to edit a contact so that I can make changes when my contacts information changes.
**Acceptance Criteria:**
User can edit a contact

---

### 6
**Title**: 
Search a contact
**Description:**
As a gembooks user, I want to search for a contact so that I don't have to manually scroll through all my contacts to find someone I'm looking for.
**Acceptance Criteria:**
User can search for a contact

---

### 7
**Title**: 
Birthdays 
**Description:**
As a gembooks user, I want the ability to enter my contacts birthday so that I can look up their birthday to wish them a happy birthday.
**Acceptance Criteria:**
User can add a birthday for a user

---

### 8
**Title**: 
Add notes
**Description:**
As a gembooks user, I want to have a section for my contacts where I am able to capture notes, so that I can keep important informatino about my contacts. 
**Acceptance Criteria:**
User can add special notes to their contact info.

---

### 9
**Title**: 
Birthday list
**Description:**
As a gembooks user, I want to see a list of contacts who's birthday is today so that the information is the first thing I see when I open up the application. 
**Acceptance Criteria:**
Gembook displays the list of users who's birthday is today upon application launch

---

### 10
**Title**: 
Upcoming birthdays
**Description:**
As a gembooks user, I want to see all upcoming birthdays for my contact so I can prepare for the occasion, in the event I need to order a gift online. 
**Acceptance Criteria:**
User selects a menu option at application launch to see upcoming birthdays

---

### 11
**Title**: 
My favorite contacts
**Description:**
As a gembooks user, I want to flag some users as my favorites so that I can retrieve those users quickly
**Acceptance Criteria:**
User can flag users as favorites

---

### 12
**Title**: 
Total contacts
**Description:**
As a gembooks user, I want to see the total number of contacts I have when I list all my contacts so I can keep track of it.
**Acceptance Criteria:**
User sees total number of contacts when selecting the List all contacts menu option.

---

### 13
**Title**: 
Additional deletion confirmation
**Description:**
As a gembooks user, I want the application to prompt me for confirmation when I am deleting a user so that I don't accidentally delete the wrong contact.
**Acceptance Criteria:**
User gets prompted for additional confirmation before deleting a contact.

---

### 14
**Title**: 
Export contacts
**Description:**
As a gembooks user, I want the ability to export all my contacts list to a csv format so I can always have a backup of my contacts list.
**Acceptance Criteria:**
User can export their contacts list to a csv file.

---

### 15
**Title**: 
Import contacts
**Description:**
As a gembooks user, I want the ability to import my contacts from a csv file in the event my application fails and need to use my backup contacts list. 
**Acceptance Criteria:**
User can import their contacts list from a csv file.

---

### 16
**Title**: 
Sort contacts
**Description:**
As a gembooks user, I want the ability to sort my contacts alhabetically by Name or City so that I can access the information quickly.
**Acceptance Criteria:**
User can search for a contact

---

### 17
**Title**: 
Error when adding contact without a name
**Description:**
As a gembooks user, I want to ensure that I do not add a contact without a name so that all my contacts have a name associated with their information.
**Acceptance Criteria:**
User can not add a contact without a name

## Developer Contributions — Benjamin Cerna

### Implementation Notes (Benjamin — 09/28 Test & Merge Session)

During this session, I completed extensive debugging, testing, and merge‑resolution work to stabilize the Gembooks application and ensure all user stories were fully supported by working features. Below is a detailed summary of the work performed:

- Executed a full manual functional test cycle across 7 major features:
  - List all contacts
  - Delete a contact
  - Edit a contact
  - Search
  - Sort
  - Upcoming birthdays
  - Exit
- Identified and corrected data integrity issues (duplicate IDs, invalid birthdays such as age 157)
- Repaired broken menu options:
  - Option 1 (Add Contact) — fixed logic preventing proper saving
  - Option 6 (Export to CSV) — corrected export flow and file generation
- Removed stray `end` statements that were causing runtime failures in `contact_book.rb`
- Fixed CSV export logic and ensured JSON persistence remained stable across all operations
- Corrected search, sort, and birthday logic to ensure accurate results and error‑free execution
- Fully merged and repaired `contact_book.rb` after resolving a major conflict between local and remote versions
- Cleaned and merged `contacts.json` and `contacts_export.csv`, removing outdated versions and conflict markers
- Restored correct documentation and contribution summaries after merge conflicts
- Resolved all merge conflicts across multiple files (Ruby, JSON, CSV, Markdown)
- Achieved full RSpec stability: **13 examples, 0 failures** after debugging and refactoring
- Verified correct behavior through repeated test cycles, including negative search paths, invalid selections, and blank‑to‑keep edit logic
- Confirmed correct birthday calculations, upcoming birthday logic, and launch‑screen birthday display

### Acceptance Criteria Status

- [x] All menu options functional
- [x] JSON persistence stable
- [x] CSV export/import working
- [x] Search, sort, and birthday logic correct
- [x] No runtime crashes
- [x] All tests passing (RSpec: 0 failures)
- [x] Merge conflicts fully resolved
- [x] Documentation updated
- [x] Manual testing validated all major user stories
