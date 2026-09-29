# Design Document
Ruby Contact Management Application Author: Benjamin Cerna, Bolu Owolana
Course: Software Engineering
Institution: Texas A&M University

### 1. Introduction
Gembooks is a Ruby-based contact management application designed to provide users
with a simple, offline, and reliable way to store and organize personal contact information.
The system offers a menu-driven command-line interface (CLI), JSON-based storage, and a full suite of features including search, sorting, editing, deletion, and birthday reminders.
This document outlines the system design, architecture, UI workflow, features, challenges, and future development plans.

### 2. End-Users
Gembooks is designed for a wide range of users who need a lightweight, private contact manager:
Everyday Individuals
People who want an organized place to store phone numbers, emails, birthdays, and notes.
Example: An individual can store family and friends’ birthdays and addresses in one place.
Students & Classmates
Users who manage group project partners, mentors, and campus contacts. 
Example: A student can keep teammates’ phone numbers and emails for quick communication.
Educators & School Staff
Teachers and administrators who maintain parent contacts or student information.
Example: A teacher can store parent contact details for easy outreach.
Club Members & Community Groups
People involved in clubs, sports teams, or volunteer groups. 
Example: A club leader can track all members’ contact information for event coordination.

### 3. Problem Statement
Many contact management tools are overly complex, require online accounts, or store
personal data in the cloud. Users who prefer privacy, simplicity, and full control over their contact information often lack a suitable offline option. Gembooks solves this by providing a fast, transparent, and fully offline contact manager.

### 4. Solution Overview
Gembooks provides a complete set of features tailored for offline contact management:
• Fully offline operation
• Menu-driven CLI interface
• JSON-based storage
• Add, edit, delete, and view contacts
• Search by multiple fields
• Sorting by name or city
• CSV import/export
• Birthday reminders
• Tags, notes, and timestamps
All data is stored locally, giving users complete control.

### 5. System Architecture
Gembooks uses a modular architecture that separates responsibilities across layers:
CLI Interface (User Interaction Layer)
• Displays menu options
• Receives user input
• Shows confirmations and errors

Application Controller (contact_book.rb)
• Routes commands (Add, View, Search, Update, Delete)
• Validates input
• Calls Contact Model methods
• Returns results to the CLI

Contact Model (contact.rb)
• Defines contact structure
• Handles create, update, delete logic
• Implements search functionality

Logging Layer (log/gembook.log)
• Records operations
• Captures errors
• Supports debugging and auditing

Storage Layer (contacts.json)
• Persistent JSON storage
• Read/write operations
• Human-readable and portable data format

### 6. UI Design
Although Gembooks is a CLI application, it follows a structured UI design philosophy:
UI Elements
• Startup reminder banner
• Clean main menu
• Number-based navigation
• Structured contact display
• Clear prompts for CRUD operations

Workflow
1. User launches the app
2. Birthday reminders display
3. Main menu appears
4. User selects an action
5. System processes and returns results

Design Justification
• Numbered menus reduce user error
• Predictable workflow improves usability
• Consistent formatting enhances readability
• Spacing and dividers make the CLI feel organized

### 7. Features
Core Features
• Add new contacts
• Edit existing contacts
• Delete contacts
• View all contacts
• Search by name, phone, email, address, tags, birthday, or notes
• Sort contacts alphabetically or by city
• CSV import/export
• Birthday reminder system

Birthday Reminder System automatically checks:
• Today’s birthdays
• Birthdays this month
• Upcoming birthdays within 30 days

Search Engine
• Supports multi-field search for fast contact retrieval.
• Sorting
• Sorts contacts by name or city for better organization.

CSV Import/Export
• Allows backup, migration, and external editing of contact data.

### 8. Challenges
During development, several challenges were encountered:
• Handling missing fields in older contacts
• Preventing crashes from empty values
• Managing duplicate IDs during JSON merges
• Ensuring CSV import/export compatibility
• Designing birthday logic that handles year rollover
These challenges improved the robustness of the application.

### 9. Lessons Learned
Key lessons from building Gembooks include:
• Importance of defensive programming
• Structuring Ruby applications cleanly
• Safely managing JSON data
• Designing user-friendly CLI workflows
• Testing with realistic data sets
These lessons will guide future software projects.

### 10. Future Plans
Potential enhancements for Gembooks include:
• Mobile app version (iOS/Android)
• Cloud sync options
• Contact groups and favorites
• Profile photos
• Encryption for sensitive data
• Android release on the Google Play Store
The current Ruby version provides a strong foundation for expansion.

### 11. Conclusion
Gembooks is a fully offline, user-friendly contact management system that meets all
project requirements. Its modular architecture, clean UI design, robust feature set, and thoughtful workflow make it a reliable tool for managing personal contact information.