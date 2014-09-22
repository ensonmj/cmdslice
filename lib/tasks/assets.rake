namespace :assets do
  desc 'recreate sprite images and css'
  task :resprite => :environment do
    require 'sprite_factory'

    SpriteFactory.library = :chunkypng
    # use a sass-rails helper method to be evaluated by the rails asset pipeline
    SpriteFactory.cssurl = "image-url('$IMAGE')"
    SpriteFactory.run!('app/assets/images/avatars',
      :output_style => 'app/assets/stylesheets/avatars.scss')
  end
end
