require 'magic_bean'

describe MagicBean do
  it 'gives 1 or 0 as parameters to the update method' do
    item = Item.new("Magic bean", 2, 0)
    MagicBean.new([item]).update_magic_beans
    expect(item.quality).to be_between(0, 1).inclusive
  end

end
