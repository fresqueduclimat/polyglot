# Polyglot

Polyglot is a Ruby on Rails application designed to streamline the translation process for the Climate Fresk community. It bridges the gap between translators and end-users by ensuring that translated documents are accessible, up-to-date, and easy to manage.

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

## Contributing

We welcome contributions to improve Polyglot! If you'd like to contribute, please:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Submit a pull request with a clear description of your changes.

## Feedback and Support

If you encounter any issues or have suggestions for improvement, please open an issue in the repository. We appreciate your feedback and will respond promptly.

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

## Adding a New Language

To add a new language to the project, follow these steps:

1. **Update Supported Languages**:
    - Go to the `app/classes/documents/languages.rb` file.
    - Add the new language to the list of supported languages. For example:
      ```ruby
        "co-FR" => {leading: 0.4}
      ```

## License

TBD
