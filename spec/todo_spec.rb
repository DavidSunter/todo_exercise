require 'date'

describe Todo do
  before(:each) { Todo.class_variable_set :@@all, [] }
  let (:a) {Todo.new("Remember the Milk", Date.today)}

  it 'initialize correctly and expose instance' do
    expect(a.title).to eq "Remember the Milk"
    expect(a.due_date).to be_a(Date)
    expect(a.due_date).to eq Date.today
  end

  it 'check the array' do
  expect(Todo.all).to eq [a]
  end

end
