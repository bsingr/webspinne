#!/usr/bin/env ruby

require 'sinatra'

def html
  %Q{<!DOCTYPE html>
    <html>
      <head><title>dummy</title></head>
      <body>#{yield}</body>
    </html>}
end

def link_to uri
  "<a href='#{uri}'>#{uri}</a><br/>"
end

get '/' do
  html do
    %Q{#{link_to '/foo'}}
  end
end

get '/foo' do
  html do
    [ link_to('/foo'),
      link_to('/bar'),
      link_to('/baz'),
      link_to('http://foo.bar.baz') ].join
  end
end

get '/bar' do
  html do
    (
      [ link_to('/foo'),
        link_to('http://subdomain.localhost:4567/') ] +
      15.times.map{|i| link_to "/#{i}"}
    ).join
  end
end

10.times do |i|
  get "/#{i}" do
    html do
      [ link_to('/foo'),
        link_to('/bar') ].join
    end
  end
end
