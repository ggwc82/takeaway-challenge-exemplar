require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new(menu: menu, order: order)}
  let(:menu) {double :menu, print: printed_menu}
  let(:printed_menu) { "Chicken: $3.50" }

  let(:dishes) { {chicken: 2, fish: 1}}
  let(:order) {instance_double("Order", total: 15.50)}
  
  it 'shows menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order some no. of several dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'knows the order total' do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end
end