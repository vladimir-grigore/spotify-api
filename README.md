# Project Title
Spotify API

## Table of Contents:
- [About The App](#about-the-app)
- [Technologies](#technologies)
- [Setup](#setup)

## About The App
Spotify API makes use of the [rspotify](https://github.com/guilhermesad/rspotify) gem to provide an easy way to retrieve information about artists, albums and tracks.

## Technologies
`rspotify`, `Ruby on Rails`, `RSpec`, `rubocop`

## Setup
- download or clone the repository
- run `bundle install`
- create a `.env` file based on `.env.example`
- To get a Spotify `CLIENT_ID` and `CLIENT_SECRET`, register a new dev app at [Spotify](https://developer.spotify.com/dashboard/create) and save them in your `.env` file
- run `rails s`
