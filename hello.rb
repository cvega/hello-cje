require 'sinatra'
require 'sinatra/json'

hello_port = ENV['HELLO_PORT'] ||= "8080"
set :port, $hello_port
set :bind, '0.0.0.0'

get  %r{/} do
  text = "Hello"
  json message: text
end

get %r{/[Hh]owdy} do
  text = "Howdy"
  json message: text
end

get %r{/[Tt]akk} do
  text = "Hello in Danish"
  json message: text
end

get %r{/[Hh]ola} do
  text = "Hello in Spanish"
  json message: text
end

get %r{/[Cc]loud[Bb]ees} do
  text = "Hello CloudBees"
  json message: text
end
