require 'rubygems'
require 'bundler'
Bundler.require

class App < Sinatra::Base
  set :root, File.expand_path('../', __FILE__)
  enable :logging
  enable :sessions

  register Sinatra::AssetPack

  assets {
    serve '/javascripts', from: 'public/javascripts'
    serve '/stylesheets', from: 'public/stylesheets'
    serve '/images',      from: 'public/images'

    js :application, [
      '/javascripts/jquery-2.0.3.min.js',
      '/javascripts/application/base.js'
    ]

    css :application, [
      '/stylesheets/application/base.css'
    ]

    js_compression  :yui
    css_compression :yui

    prebuild true
  }

  # load app files
  [
    "routes/**/*.{rb}"
  ].each {|path| Dir[path].each{|file| require_relative file}}
end
