require 'sinatra'
require 'pusher'

Pusher.app_id = '45285'
Pusher.key = '898d03e2953cbf6d85c1'
Pusher.secret = 'ae065864ed41591fd0fb'

get '/' do
  erb :index
end

get '/color' do
  erb :color
end

get '/color-report' do
  headers['X-Frame-Options:'] = 'GOFORIT'
  erb :color_report
end

post '/choose-color' do
  color = params[:color]
  Pusher.trigger('color', 'choose', {color: color})
end
