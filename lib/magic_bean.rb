require 'update_methods'

class MagicBean
  include UpdateMethods

  def initialize(items)
    @magic_beans = items.select { |i| i.name == "Magic bean" }
  end

  def update_magic_beans
    update(@magic_beans, rand(2), rand(2))
  end

end
