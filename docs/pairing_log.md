# Pairing Log

## Session 1
Driver: Bolu
Navigator: Benjamin  

Work completed:
- Created github repository and kanban board
- Set up GitHub repository and Kanban board
- Added initial logic to create contacts.json automatically
- Built the first version of the application launch menu
- Implemented the “Add Contact” workflow

Notes
- Discussed JSON structure and field naming conventions
- Agreed on auto‑incrementing ID strategy

--

## Session 2
Driver: Benjamin
Navigator: Bolu

Work Completed:
- Implemented delete and edit contact logic
- Added search functionality
- Added birthday and notes features
- Updated contact schema to support new fields

Notes
- Decided to expand the contact data model
- Identified need for refactoring the test suite

--

## Session 3
Driver: Bolu
Navigator: Benjamin

Work Completed:
- Wrote initial RSpec test for adding a contact
- Added logic to create contacts.json if missing
- Improved menu navigation and user prompts

Notes
- Discussed test isolation strategy
- Planned future sad‑path tests

--

## Session 4
Driver: Benjamin
Navigator: Bolu

Work Completed:
- Refactored add_contact test for isolation
- Refactored contact book file handling
- Added upcoming birthdays and age calculation
- Added notes feature to contact management

Notes
- Identified need for class‑based architecture
- Updated backlog to reflect refactor tasks

--

## Session 5
Driver: Bolu
Navigator: Benjamin

Work Completed:
- Added total count of contacts to list all contacts menu
- Added feature to prevent contact without a name from being added
- Added deletion confirmation feature
- Added feature to show today's birthdays on app launch

Notes
- Discussed plan for presentation
- Discussed additional testing needed
- Bugfix for birthday sort issue

-- 

## Session 6
Driver: Benjamin
Navigator: n/a
Work Completed:
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

-- 

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
