# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# rails g model Subject kcode:string unit:float kname:string grade:string semester:string time:string location:string lecturer:text summary:text note:text credit:string condition:text alternative:string

File.foreach('vendor/subject/cutted_subjects.tsv') do |line|
  next if $. == 1
  items = line.split(/\t/)
  Subject.create({:kcode=>items[0].sub(/\.0$/,''), :kname=>items[1], :unit=>items[2], :grade=>items[3], :semester=>items[4], :time=>items[5], :location=>items[6], :lecturer=>items[7], :summary=>items[8], :note=>items[9], :credit=>items[10], :condition=>items[11], :alternative=>items[12]})
end
