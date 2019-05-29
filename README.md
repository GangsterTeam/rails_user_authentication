# README
## User Authentication using Devise gem

### Ruby version - 2.6
### Rails version - 5.2.3

1. create new rails application ```rails new rails_user_authentication```
2. chnage location ```cd rails_user_authentication```
3. Gemfile ```gem 'devise'```
4. Install devise gem 
```ruby
bundle
rails g devise:install
```
5. ```rails g devise User```
6. **config/environments/development.rb**
```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
7. ```rake db:migrate```
8. ```rails g model Blog```
9. ```rails g controller blogs index```
10. **app/models/user.rb**
```ruby
class User < ActiveRecord::Base
    has_many :blogs
    devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable
end
```
11. **app/models/blog.rb**
```ruby
class Blog < ActiveRecord::Base
    belongs_to :user
end
```
12. **db/migrate/*.rb**
```ruby 
class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.belongs_to :user
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
```
13. ```rake db:migrate```
14. **BlogsController**
```ruby
class BlogsController < ApplicationController
  # before any blog action happens, it will authenticate the user
  before_action :authenticate_user!
  def index
    @user = current_user.email
  end
  #Other Restful methods show, new, edit, create, update, destroy
end
```
15. **routes**
```ruby
Rails.application.routes.draw do
  root 'blogs#index'
  devise_for :users
  resources :users do
    resources :blogs
  end
end
```
16. **blog index** > ```<h1>Welcome !</h1>```
