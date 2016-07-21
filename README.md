## Introduction

UpTune is an app where users collaborate and vote on Spotify playlists. Playlists are dynamically reordered based on track voting. This project was completed as part of the module 3 curriculum at the Turing School of Software and Design. 

## Development

This project is built using Rails and a PostgreSQL database, and uses the Spotify API for user OAuth and track and playlist management.

It can be run locally on your machine by cloning the project down and running ```rake db:setup```.

### Test Suite
The test suite is built using RSpec and tests models, controllers, and features. Feature tests are written using Capybara to mimic the user experience. To run the entire test suite, from the command line in the root of the app directory, run ```rspec```.

## Production

The production app is hosted [here](uptune.herokuapp.com) on Heroku.
Use Spotify credentials to log-in and start a new playlist. Share the unique playlist URL with friends to create playlists, or mimic multiple users using different browsers.
