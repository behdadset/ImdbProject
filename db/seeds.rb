User.destroy_all

User.create :first_name => 'Behdad', :last_name => 'Set', :email => 'behdad@gmail.com', :password => 'chicken', :admin => true
User.create :first_name => 'Russell', :last_name => 'Drysdale', :email => 'test@gmail.com', :password => 'chicken'
puts "#{ User.count } artists created."

  