class FileProcessorService

  def process_in()
    puts 'Init processing files...'
    in_path = "#{ENV['HOME']}/data/in"
    if(Dir.exist?(in_path)) 
      process_file_in(in_path)
    else 
      Dir.mkdir(in_path)
      puts 'created new dir and awaiting for files...'
    end
  end

  private

  def process_file_in in_path
    Dir.glob("#{in_path}/*.dat") do |f|
      to_write = init_write()
      puts "checking #{f}..."
      File.open(f, 'r').each do |line|
        splitted = line.split('ç')
        process_line(splitted, to_write)
      end
      to_write[:infos][:bestSale] = to_write[:sales].max { |a, b| a[:saleAmount] <=> b[:saleAmount]}
      process_out(to_write, f)
    end
    puts 'success...'
  end

  def process_out_file out_path, to_write, originalFile
    Dir.chdir(out_path) do |path|
      file = File.basename(originalFile, '.*')
      file = "#{file}.json"
      write = Hash.new
      write['clients'] = to_write[:clients]
      write['sellers'] = to_write[:sellers]
      write['sales'] = to_write[:sales]
      write['infos'] = to_write[:infos]
      puts "writing #{path}/#{file}..."
      file = File.new("#{path}/#{file}", 'w')
      file.write(write.to_json)
    end
  end

  def process_out(to_write, originalFile)
    out_path = "#{ENV['HOME']}/data/out"
    if Dir.exist?(out_path)
      process_out_file(out_path, to_write, originalFile)
    else
      Dir.mkdir(out_path)
      puts 'created new dir and files'
      process_out_file(out_path, to_write, originalFile)
    end
  end

  def process_line(splitted_line, to_write)
    case splitted_line[0]
    when '001'
      to_write[:sellers].push(process_salesman(splitted_line, to_write))
    when '002'
      to_write[:clients].push(process_client(splitted_line, to_write))
    else
      to_write[:sales].push(process_sale(splitted_line))
    end
  end

  def process_client(value, to_write)
    hash = Hash.new
    hash['id'] = value[0]
    hash['CNPJ'] = value[1]
    hash['name'] = value[2]
    hash['businessArea'] = value[3]
    if to_write[:clients].exclude?(hash['CNPJ'])
      to_write[:infos][:amountClients] = to_write[:infos][:amountClients] + 1
    end
    hash
  end

  def process_salesman(value, to_write)
    hash = Hash.new
    hash['id'] = value[0]
    hash['CPF'] = value[1]
    hash['name'] = value[2]
    hash['salary'] = value[3]
    if to_write[:sellers].exclude?(hash['CPF'])
      to_write[:infos][:amountSellers] = to_write[:infos][:amountSellers] + 1
    end
    hash
  end

  def process_sale(value)
    hash = Hash.new
    hash['id'] = value[0] 
    hash['saleId'] = value[1]
    hash['items'] = []
    items = value[2].gsub('[', '').gsub(']', '').split(',')
    processed = process_item(items)
    hash['items'] = processed[:items]
    hash['salesmanName'] = value[3]
    hash['saleAmount'] = processed[:saleAmount]
    hash
  end

  def process_item(values) 
    to_return = Hash.new
    to_return[:items] = [];
    to_return[:saleAmount] = 0
    values.each do |item|
      item_splitted = item.split('-')
      item_hash = Hash.new
      item_hash['id'] = item_splitted[0]
      item_hash['quantity'] = item_splitted[1]
      item_hash['price'] = item_splitted[2]
      to_return[:saleAmount] =  to_return[:saleAmount] + item_splitted[2].to_f
      to_return[:items].push(item_hash)
    end
    to_return
  end

  def init_write
    to_write = Hash.new
    to_write[:sellers] = []
    to_write[:clients] = []
    to_write[:sales] = []
    to_write[:infos] = Hash.new
    to_write[:infos][:amountSellers] = 0
    to_write[:infos][:amountClients] = 0
    to_write
  end
end