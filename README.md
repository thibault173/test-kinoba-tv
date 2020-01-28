## Installation

### Requirements

* **Ruby**:

* **Bundler**:

* **Yarn**

* **SQLite3**

### Setup

+ Clone git repo

  git clone git@github.com:thibault173/test-kinoba-tv.git
  cd test-kinoba-tv

+ Run bundle

+ Run yarn

+ Import database

  sqlite3 tribe_members.sqlite .dump > dump.sql
  sqlite3 db/development.sqlite3 < dump.sql

+ Migration database

  rails db:migrate

+ Keys

  Create a .env file in root file
  Ask team for keys :

  MAPBOX_API_KEY

Rails app generated inspired from [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
