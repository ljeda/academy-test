describe City do

  before(:each) { @city = City.new(name: 'London', short_name: 'Ld') }

  subject { @city }

  it { should respond_to(:name) }

  it { should respond_to(:short_name) }


  it "#name returns a string" do
    expect(@city.name).to match 'London'
  end

  it "#short_name returns a string" do
    expect(@city.short_name).to match 'Ld'
  end

  it "#name presence is validated" do
    (City.new(short_name: 'Msc').save).should == false
  end

  it "#short_name presence is validated" do
    (City.new(name: 'Moscow').save).should == false
  end

  it "#name length is validated" do
    (City.new(name: 'VeryVeryVeryLongCityName', short_name: 'Msc').save).should == false
  end

  it "#short_name length is validated" do
    (City.new(name: 'Moscow', short_name: 'Moscow').save).should == false
  end

end
