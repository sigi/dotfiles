require 'rubygems'
require 'ap'

# Just for Rails...
if rails_env = ENV['RAILS_ENV'] && !defined?(JRUBY_VERSION)
  # Called after the irb session is initialized and Rails has
  # been loaded (props: Mike Clark).
  IRB.conf[:IRB_RC] = Proc.new do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.instance_eval { alias :[] :find }
    require 'hirb'
    Hirb.enable
  end
end

