 
## Typekit Explorer

Simple command line application to explore your Typekit kits

#### Getting Started
You'll need a Typekit API key, which you can find under your Typekit account here: https://typekit.com/account/tokens

Create your own copy of `config/application.yml` by running `cp config/application.yml.example config/application.yml` from the command line

Update the API key in `config/application.yml`

#### Specs
Run the unit tests using `rspec`

Run Cucumber integration specs using `cucumber`

The Cucumber integration specs only test the basic functionality of the app and do not call out to the Typekit API

If you'd like to run API specific tests, set up your API key, `cp features/explore_kits_api.feature.example features/explore_kits_api.feature`, and update the specs

#### Running the explorer
Run `ruby lib/explore_typekit.rb`

##### Supported Commands:
- `exit` to exit the program
- `help` to see the list of commands
- `list` to see all your kit'
- `show [kit id]` to see more about a kit (e.g. `show 1ek34f`)
