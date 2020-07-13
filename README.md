# Code Challenge

Welcome to the Main Street code challenge. This repository includes a very basic rails app to be used to assessment and testing purposes only.

Note: This codebase is not nearly or fully representative of our platform however it's a good small sample of the kinds of technology and problems we are solving.

## Getting Started

Dependencies:

- Rails 6 (Framework)
- Postgres (For Database)
- Node (For Webpacker / Rails Dependencies)

This repository has a `bin/setup` script that should get things up and running for the majority of users if you have the above dependencies installed.

From the root of the project directory - simply run:

`bin/setup`

Once that runs you should be able to run the following 2 commands in separate terminal tabs / windows:

1.  `rails s` - this will start the rails server locally.
2.  `bin/webpack-dev-server` - this will start to watch and recompile the JavaScripts found in `app/javascript`

## Challenges

### ☐ Add a way to delete companies

For companies, there isn't currently a way to destroy them. There should be a confirmation of the action. Some kind of "Are you sure?" message. - Done

### ☐ Add Custom Validation to company email Address (When Present)

All email addresses for new companies should only be a @getmainstreet.com domain. A custom error should render when attempting to create or update a company when the email does not match this domain. This should only be when email is present. Blank emails can be ignored. - Done

### ☐ Add City State To Companies from Zip Code.

For each company "Show" page there is a placeholder for the City, State for that company. You'll need to leverage the zip code to have that value render the actual City, State. For example: Nashville, TN. It is strongly recommended to use the ZipCodes gem that is already in this project.

Every time the company's zip code is updated this city and state should be updated.

The City and State should be added as attributes to the Company object. - Done. A rake task is added in bin/setup to prepopulate for existing Companies.

### ☐ Include test coverage for all your changes

For all functionality extend or add tests from existing tests. - Done
