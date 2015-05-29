require 'roo'

abort("usage: ruby parse_xlsx.rb <.xlsx>") if ARGV.size != 1

out = open("vendor/subject/subjects.tsv","w")

s = Roo::Excelx.new(ARGV[0])  # .xlsx を読み込むときは Roo::Excelx.new                                                  
s.each_with_index do |arr, index|
  next if index <= 3
  record = []
  arr.each_with_index do |item, index_2|
    next if index_2 == 2 || index_2 == 14
    if item != nil
      item = "#{item.to_s.gsub(/\n/, '')}"
    end
    record.push(item)
  end
  out.puts record.join("\t").sub(/\t$/,'')
end

out.close
