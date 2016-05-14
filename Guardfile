# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separately)
#  * 'just' rspec: 'rspec'

guard :rspec, cmd: "bundle exec rspec" do
  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  # Feel free to open issues for suggestions and improvements

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  # Rails files
  rails = dsl.rails(view_extensions: %w(erb haml slim))
  dsl.watch_spec_files_for(rails.app_files)
  dsl.watch_spec_files_for(rails.views)

  watch(rails.controllers) do |m|
    [
      rspec.spec.("routing/#{m[1]}_routing"),
      rspec.spec.("controllers/#{m[1]}_controller"),
      rspec.spec.("acceptance/#{m[1]}")
    ]
  end

  # Rails config changes
  watch(rails.spec_helper)     { rspec.spec_dir }
  watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
  watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

  # Capybara features specs
  watch(rails.view_dirs)     { |m| rspec.spec.("features/#{m[1]}") }
  watch(rails.layouts)       { |m| rspec.spec.("features/#{m[1]}") }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
  end
end

guard :rspec, cmd: 'rspec -f html -o ./tmp/spec_results.html', launchy: './tmp/spec_results.html' do
  # ...
end

coffeescript_options = {
  input: 'coffeescripts',
  output: 'javascripts',
  patterns: [%r{^app/assets/javascripts/(.+\.(?:coffee|coffee\.md|litcoffee))$}]
}

guard 'coffeescript', coffeescript_options do
  coffeescript_options[:patterns].each { |pattern| watch(pattern) }
end

# TODO: ERROR occurs with guard not  recogonizing $variables, but
# not color.scss.
guard 'sass', input: 'app/assets/stylesheets', noop: true

###
# Sample Guardfile block for Guard::Uglify
#
# :input        - input file to compress
# :output       - file to write compressed output to
# :run_at_start - compressed input file when guard starts
# :uglifier     - options to be passed to the uglifier gem
###

# TODO: Add guard to watch all js. May need to add guard-concat
guard "uglify", input: "app/assets/javascripts/application.js", output: "public/javascripts/application.js"
# guard "uglify", input: "app/assets/javascripts/application.js", output: "public/javascripts/application.js"

# TODO: "Uncomment and set up ENV for AWS"
# Uncomment to
# opts = {
#   bucket:            ENV.fetch('S3_BUCKET_NAME'),
#   access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
#   secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
#   s3_region:         ENV.fetch('AWS_REGION'),
#   s3_host_name:      's3-us-west-2.amazonaws.com',
#   s3_permissions:    :public_read
# }
#
# guard 's3', opts do
#   # TODO: Verify correct watch path
#   watch(/images.*/)
# end
