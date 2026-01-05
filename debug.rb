# debug.rb
class Object
  def tainted?; false; end
  def taint; self; end
  def untaint; self; end
end
exec("bundle exec jekyll serve")
