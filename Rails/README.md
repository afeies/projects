Installing Ruby on Rails:
- https://gorails.com/setup/macos/15-sequoia

Create a new Rails app:
- rails new <project-name>

Gemfile:
- specify gems and their versions

Run project:
- rails server
- rails s

HTTP Requests
Model View Controller

Routes:
https://guides.rubyonrails.org/routing.html
- config/routes.rb
- get "up" -> ...
    - URL: .../up

Controllers:
- app/controllers
- add a new controller for every route

Views:
- app/views
- add a new view folder for every route
- inside folder add index.html.erb
    - HTML layout of page