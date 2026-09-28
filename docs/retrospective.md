# Retrospective

### What went well
- Having the initial discussion regarding gameplan and structure of the application.
- Choosing JSON format as the data store to store contact data. 
    - This made things more human readable
    - Required no additional setup or tooling installed
    - Made testing a breeze
- Building functions such as load_contact_book, age_from_birthday, upcoming_birthdays and next_id was a game changer to help simplify codebase
- Keeping code modular
- Planning workflows before coding

### What was difficult
- Finding time to continuously work on the project as two working adults
- Fixing many JSON formatting errors
- Missing logs and directory mapping
- Installing Ruby version 3.2
- Rubocop installation issues
- Gracefully handling user inputs and error messages


### Improvements
- Add color to the terminal display
- Introduce more classes such as Storage and Contacts class
- Add a display that says "No birthday's today" instead of being empty if there's no birthdays.
- Validate every input to ensure its sanitized
- A graphical user interface
- Cloud based syncing to run the application and store data on multiple devices
- Authentication to make this a multi user experience

### Conclusion
The gembooks app met its original goal. The goal at the onset was simple, build a working terminal app with Ruby that lists, adds, edits, deletes, edits stores contact data safely. Test suites were also written to ensure that the application's functionality works as expected. Anybody that is able to clone this repo can run the application successfully, which makes this a success.