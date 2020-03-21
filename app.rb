  require "sinatra"
  require "sinatra/reloader"
  require "sinatra/activerecord"
  set :database, { adapter: "sqlite3", database: "mydb.db" }
  
  require './models/user'
  require './models/team'
  
  get '/' do
    erb :main
  end
  
  get '/name' do
    erb :name
  end
  
  get '/team' do
    erb :team
  end
  
  post '/n_look_up' do
   users = User.find_by(name: params[:name]) 
    if !users.nil?
     "User name: #{users.name}, Email: #{users.email}, Team ID: #{users.team_id}, Team: #{users.team.name}"
    else
      "User #{params[:name]} does not exist"
    end
   end                  
   
   
   post '/t_look_up' do
     @t = Team.find_by(name: params[:team])
     if @t.nil?
       return "Team Not Found"
     end
     erb  :t_look_up
  end
    