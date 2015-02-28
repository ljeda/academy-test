user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

{ 'London' => 'Ld', 'Cracow' => 'Krk', 'Berlin' => 'Ber', 'Rome' => 'Rom', 'Paris' => 'Par', 'Oslo' => 'Os', 'Porto' => 'Por' }.each do |name, short_name|
  City.new(name: name, short_name: short_name).save if City.find_by(name: name).nil?
end