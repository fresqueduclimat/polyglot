# Polyglot
Polyglot is a Ruby on Rails application designed to streamline the translation process for the Climate Fresk community. It bridges the gap between translators and end-users by ensuring that translated documents are accessible, up-to-date, and easy to manage.

# Table of Contents

1. [Polyglot](#polyglot)
2. [Purpose](#purpose)
3. [Features](#features)
4. [Workflow](#workflow)
   - [Translation in Tolgee](#translation-in-tolgee)
   - [Importing to Polyglot](#importing-to-polyglot)
   - [Accessing Translations](#accessing-translations)
   - [Updating Translations](#updating-translations)
5. [Installation](#installation)
6. [Deployment](#deployment)
   - [Staging Branch](#staging-branch)
   - [Main Branch](#main-branch)
7. [Contributing](#contributing)
7. [Contributing](#contributing)
8. [DocumentController#show](#documentcontrollershow)
   - [Workflow Breakdown](#workflow-breakdown)
9. [Feedback and Support](#feedback-and-support)
10. [Adding a New Document](#adding-a-new-document)
   - [Get the New Document ID](#get-the-new-document-id)
   - [Create a REST API Key](#create-a-rest-api-key)
   - [Update the Environment Variables](#update-the-environment-variables)
   - [Add Document Templates](#add-document-templates)
   - [Update Document Settings](#update-document-settings)
   - [Generate the Configuration File](#generate-the-configuration-file)
11. [Documenting the `generate:ruby_config` Rake Task](#documenting-the-generaterubyconfig-rake-task)
    - [Task Definition](#task-definition)
    - [How to Use](#how-to-use)
12. [Adding a New Language](#adding-a-new-language)
13. [License](#license)


## Purpose

The primary goal of Polyglot is to ease the translation workflow, ensuring that translated materials are available in multiple languages to meet the diverse needs of the Climate Fresk community. It seamlessly integrates with [Tolgee](https://translate.climatefresk.org), a translation management system, to offer a complete translation and distribution solution.

## Features

- **Integration with Tolgee**: Polyglot imports translations from Tolgee, where documents are collaboratively translated by community members.
- **Multilingual Document Viewing**: Users can view translated documents in their preferred language.
- **Real-Time Updates**: Changes made to translations in Tolgee are automatically reflected in the Polyglot app.
- **User-Friendly Interface**: Provides an intuitive interface for browsing and accessing translations.

## Workflow

1. **Translation in Tolgee**:
    - Translators use [Tolgee](https://translate.climatefresk.org) to translate various documents into multiple languages.

2. **Importing to Polyglot**:
    - Once translations are complete, they are imported into the Polyglot app.

3. **Accessing Translations**:
    - Users can browse and view the translated documents in their preferred language.

4. **Updating Translations**:
    - If modifications are required, users can suggest or make changes in Tolgee. These updates will be synced with Polyglot, ensuring translations remain accurate and current.

## Installation

To set up Polyglot locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/fresqueduclimat/polyglot/.git
   cd polyglot
   ```

2. Install dependencies:
   ```bash
   docker-compose build
   docker compose run web yarn install
   ```

3. Set up the database:
   ```bash
   docker-compose run web rails db:setup
   ```

4. Start the server:
   ```bash
   docker-compose up
   ```

5. Visit the app in your browser at `http://localhost:3000`.

## Deployment

The application is hosted on AWS EC2 instances. CI/CD is automated based on branch pushes using GitHub Actions. The deployment process is as follows:

- **Staging Branch**:
  - Pushing to the `staging` branch deploys the app to the staging environment.
  - The app is accessible at: [https://resources.climatecollage.net/](https://resources.climatecollage.net/).

- **Main Branch**:
  - Pushing to the `main` branch deploys the app to the production environment.
  - The app is accessible at: [https://resources.climatefresk.org/](https://resources.climatefresk.org/).

## `DocumentController#show`

The `show` action in the `DocumentController` is the core functionality for fetching, translating, and generating PDF documents in multiple languages. Here's an overview of its workflow:

### Workflow Breakdown

1. **Fetch Available Documents**:
   - Utilizes the `Documents::FetcherService` to retrieve a list of documents.
   - Selects a specific document based on the `document_id` parameter or defaults to the first document.

2. **Fetch Supported Languages**:
   - Calls `Tolgee::LanguagesFetcherService` with the document ID and API key to retrieve the list of languages supported for the selected document.
   - Extracts language tags for use in language selection.

3. **Select Language**:
   - Leverages the `Languages::SelecterService` to determine the language based on the provided `language` parameter or a default value.

4. **Map Documents**:
   - Processes the list of documents using `Documents::MappingService` for structured access.

5. **Fetch Translated Content**:
   - Calls `Tolgee::ContentFetcherService` to retrieve the content of the document in the selected language.

6. **Generate PDF File**:
   - Defines the file path for the PDF.
   - Configures the document template using the associated configuration module.
   - Passes the fetched data and configuration to `Pdf::GeneratorService` to create a PDF document with the correct language and formatting.

## Contributing

We welcome contributions to improve Polyglot! If you'd like to contribute, please:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Submit a pull request with a clear description of your changes.

## Adding a New Document

To add a new document to the project, follow these steps:

1. **Get the New Document ID**:
    - In Tolgee, find the new document ID. (24 in this example: `https://translate.climatefresk.org/projects/24`).

2. **Create a REST API Key**:
    - In Tolgee, create a REST API key specifically for the new document.

3. **Update the Environment Variables**:
    - In your local environment `.env` file, add the new document API key.
    - For staging and production environments, add the new document API key as environment variables. This is managed using **Terraform** (DevOps).

4. **Add Document Templates**:
    - Add the empty PDF document template and the corresponding configuration JSON file to the `resources/templates` folder in the project.

5. **Update Document Settings**:
    - Modify the `Documents::Base` module in the `app/classes/documents/base.rb` file to include the new document settings.

6. **Generate the Configuration File**:
    - Run the following rake task to generate the new document configuration file:
      ```bash
      rake generate:ruby_config
      ```
    - This will create the configuration file in the `app/classes/documents` folder.

## Documenting the `generate:ruby_config` Rake Task

### Task Definition

The `generate:ruby_config` rake task is used to generate configuration files for new documents. This task relies on specific constants and a service class to create the required configuration. Below is a detailed explanation:

### How to Use

1. Define the appropriate constants (`PAGE_WIDTH`, `PAGE_HEIGHT`, and `PROJECT_NAME`) for the document you are configuring.
2. Run the rake task:
   ```bash
   rake generate:ruby_config
   ```
3. The task will generate the configuration file in the `app/classes/documents` folder using the `ImportService` class.


## Adding a New Language

To add a new language to the project, follow these steps:

1. **Update Supported Languages**:
    - Go to the `app/classes/documents/languages.rb` file.
    - Add the new language to the list of supported languages. For example:
      ```ruby
        "co-FR" => {leading: 0.4}
      ```

## Feedback and Support

If you encounter any issues or have suggestions for improvement, please open an issue in the repository. We appreciate your feedback and will respond promptly.


## License

TBD
