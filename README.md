# CoffeeMakr

## Install

### Clone the Project Repository

```shell
git clone git@github.com:alexcoldbrew/coffeemakr.git
cd coffeemakr
```

### Check Your Ruby Version

```shell
ruby -v
```

This was built in Ruby 2.6.1, you may install the correct Ruby version by:

```shell
rbenv install 2.6.1
```

### Install Dependencies

Using Bundler

```shell
bundle install
```

### Initialize the Database

```shell
rails db:create db:migrate db:seed
```

## Server

view the project in your browser at http://localhost:3000/ by:

```shell
rails s
```