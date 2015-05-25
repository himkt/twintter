# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# rails g model Subject kcode:string unit:float kname:string grade:string semester:string time:string location:string lecturer:text summary:text note:text credit:string condition:text alternative:string

=begin
File.foreach('vendor/subject/cutted_subjects.tsv') do |line|
  next if $. == 1
  items = line.split(/\t/)
  Subject.create({:kcode=>items[0].sub(/\.0$/,''), :kname=>items[1], :unit=>items[2], :grade=>items[3], :semester=>items[4], :time=>items[5], :location=>items[6], :lecturer=>items[7], :summary=>items[8], :note=>items[9], :credit=>items[10], :condition=>items[11], :alternative=>items[12]})
end
=end

=begin
comments = [
"課題出た？",
"なんか眠くなってきた",
"完全に理解した",
"この授業楽しいな",
"全く理解できない",
"早く終われ頼む",
"楽しい。わかってきた",
"こんなに簡単だったのか。"
]

kcodes = Subject.all

100000.times do
  kcode = kcodes.sample(1)[0].kcode#[:kcode]
  Now.create({:subject_kcode=>kcode, :text=>comments.sample(1)[0]})
end
=end


dic = Hash.new

puts 'load a model...'
File.foreach('vendor/model/pn_ja.dic') do |line|
  if item = line.chomp.split(/\:/)
    dic[item[0]] = item[3]
  end
end
File.foreach('vendor/model/pn_en.dic') do |line|
  if item = line.chomp.split(/\:/)
    dic[item[0].stem] = item[2] unless dic[item[0].stem]
  end
end
puts 'done'

p dic.size

puts 'seed data'
puts 'done'
