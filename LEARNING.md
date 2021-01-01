**LEARNING**
- Gems
 - Devise = gem for authentication
 - Rack_attack = gem for block bruteforce
 - simple_token_authentication = for protected the routes, for requests
- Devise uses
  - to generate user: "rails generate devise User"
    > after: "rails g migration addNameToUser name:string" 
    | to create more one column in the migration containing name of user, this command generate one model

- rails c
  - with rails c, us have a power of debug our system
  - rails c <- is a command to use rails console, where us have a power of use methods of one model (ex: User.create <~ using method create of model User)