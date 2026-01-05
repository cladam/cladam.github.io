# _plugins/ruby_patch.rb
if RUBY_VERSION >= '3.2'
  class Object
    def tainted?
      false
    end
  end
end