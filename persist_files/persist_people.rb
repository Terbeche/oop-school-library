require 'json'

module PersistPeople
  def store_people(persons)
    persons_array = []
    file = './json_files/people.json'
    return unless File.exist?(file)

    persons.each do |person|
      case person
      when Student
        persons_array << { age: person.age, name: person.name,
                           parent_permission: person.parent_permission }

      when Teacher
        persons_array << { age: person.age, name: person.name,
                           parent_permission: person.parent_permission, specialization: person.specialization }

      end
    end
    File.write(file, JSON.generate(persons_array))
  end

  def fetch_people
    persons_array = []
    file = './json_files/people.json'
    return persons_array unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |person|
      persons_array << if person['specialization'].nil?
                         Student.new(person['age'], person['name'], person['parent_permission'])
                       else
                         Teacher.new(person['age'], person['name'], person['specialization'])
                       end
    end

    persons_array
  end
end
