# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

<<<<<<< Updated upstream
%w( scroll bootstrap.min jquery sidebar profilemenu stripe_connect myjobs).each do |filename|
  Rails.application.config.assets.precompile += ["#{filename}.js"]
end
=======
Rails.application.config.assets.precompile += %w(scroll.js)
Rails.application.config.assets.precompile += %w(bootstrap.min.js)
Rails.application.config.assets.precompile += %w(jquery.js)
Rails.application.config.assets.precompile += %w(sidebar.js)
Rails.application.config.assets.precompile += %w(index.js)
Rails.application.config.assets.precompile += %w(stripe_connect.js)
Rails.application.config.assets.precompile += %w(style1.css)
Rails.application.config.assets.precompile += %w(style2.css)
>>>>>>> Stashed changes

%w( welcome users home profile ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.css"]
end
%w( index global sidebar forms search myjobs ).each do |filename|
  Rails.application.config.assets.precompile += ["#{filename}.css"]
end
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
