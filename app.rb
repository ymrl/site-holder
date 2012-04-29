#coding:utf-8
require 'sinatra'
require 'punycode'
require 'rack'
require 'haml'

get '/*' do
  @one_line_message = request.host.split('.').map!{|i|i=~/^xn--(.*)$/?Punycode.decode($1):i}.join('.')
  #@one_line_message  = Punycode.decode(request.host)
  @title = @one_line_message
  haml :index
end
