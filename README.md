# Styria - Core

- An engaging platform for all the employees that helps to get all the information at ease.
---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Setup](#project-setup)
- [Running Application](#running-application)
- [Application Overview](#application-overview)
- [Branches Overview](#branches-overview)
- [Project Structure](#project-structure)
- [Team](#team-members)
---

### Prerequisites

| Tool | Version |
| :--- | ------- |
| **Flutter** | 3.24.4 | stable |
| **Dart** | 3.5.4 | stable |
| **Java** | openjdk-17 |

---

### Project Setup


2. Navigate to **styria-flutter-web** folder

    > cd styria-flutter-web

3. Checkout to **development** branch
    
    > git checkout development

4. Install required dependencies

    > flutter pub get

---

### Running Application

1. To start widgetbook

    > **flutter run -t lib/widgetbook.dart** in root directory

2. To start mobile application

    > **flutter run** in root directory

3. To start web application

    > **flutter run -d chrome** in root directory

---

### Application Overview

The application is built on a single codebase located within the lib folder. It follows a structured design system hierarchy where atoms form molecules, molecules combine into organisms, and organisms are utilized as components. The application supports two distinct themes: Light and Dark. Page layouts are defined through specific layout structures within the application.

---

### Branches Overview

| Branch | Protected? | Base Branch | Description |
| :--- | ------- | ------- | ------- |
| `main` | NO | N/A | Live in production (**stable**) |
| `development` | NO | `development` | Local & Dev servers |

---

### Project Structure

    .
    ├── styria-flutter-web                              
    │   ├── /lib                               
    │   │   ├── /constants                        # Contains application constants such as API URLs
    │   │   ├── /design_system          
    │   │   │   ├── /atoms                        # Contains reusable UI elements like buttons, inputs, tabs, tags etc
    │   │   │   ├── /molecules                    # Contains UI components built by combining multiple atoms
    │   │   │   ├── /organisms                    # Contains more complex UI components, combining molecules and atoms
    │   │   │   ├── /theme                        # Contains theming configurations such as color schemes and typography
    │   │   ├── /layouts                          # Contains layout structures for pages and components
    │   │   ├── /pages                            # Contains the main application pages and their logic
    │   │   ├── /routing                          # Manages the application's routing and navigation logic
    │   │   ├── /shared                           # Contains shared utilities, services, and helper functions
    │   │   ├── app.dart                          # Main application entry point for setting up the app structure
    │   │   ├── main.dart                         # Entry point for running the application
    │   │   ├── widgetbook.dart                   # Configures the Widgetbook for component previews and testing
    │   │   ├── widgetbook.directories.g.dart     # Auto-generated file for Widgetbook component directories
    ├── README.md                                 # Documentation for the application, including setup and usage instructions
    └── CHANGELOG.md                              # Release notes detailing updates and changes

---

### Team Members

* [Adil Parayil](https://git.idc.tarento.com/adilparayil)
* [Arathi Vinod](https://git.idc.tarento.com/arathi.vinod)
* [Esakki Raju E](https://git.idc.tarento.com/Esakkiraju)
* [Sakthivel G](https://git.idc.tarento.com/SakthivelG)
* [Sana Parvin](https://git.idc.tarento.com/sanaparvin)
* [Shoaib Mohmad](https://git.idc.tarento.com/shoaibmohmad)

