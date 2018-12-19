require_relative('../models/animal')
require_relative('../models/owner')

require('pry-byebug')

Animal.delete_all()
Owner.delete_all()

owner1 = Owner.new({'first_name' => 'John', 'last_name' => 'McAfee', 'age' => 73 })
owner1.save()

owner2 = Owner.new({'first_name' => 'Elon', 'last_name' => 'Musk', 'age' => 47 })
owner2.save()

owner3 = Owner.new({'first_name' => 'Holly', 'last_name' => 'Willoughby', 'age' => 37 })
owner3.save()



animal1 = Animal.new({'name' => 'Charlie', 'type' => 'Dog', 'admission_date' => '25/03/2016', 'adoptable' => false, 'owner_id' => owner1.id })
animal1.save()

animal2 = Animal.new({'name' => 'Bella', 'type' => 'Dog', 'admission_date' => '14/07/2016', 'adoptable' => false, 'owner_id' => owner2.id })
animal2.save()

animal3 = Animal.new({'name' => 'Molly', 'type' => 'Cat', 'admission_date' => '01/08/2016', 'adoptable' => false, 'owner_id' => owner3.id })
animal3.save()

animal4 = Animal.new({'name' => 'Simba', 'type' => 'Dog', 'admission_date' => '08/09/2017', 'adoptable' => true })
animal4.save()

animal5 = Animal.new({'name' => 'Loki', 'type' => 'Dog', 'admission_date' => '12/01/2018', 'adoptable' => true })
animal5.save()

animal6 = Animal.new({'name' => 'Romeo', 'type' => 'Bear', 'admission_date' => '01/03/2018', 'adoptable' => false })
animal6.save()

animal7 = Animal.new({'name' => 'Casper', 'type' => 'Tiger', 'admission_date' => '14/06/2018', 'adoptable' => false })
animal7.save()

binding.pry
nil
