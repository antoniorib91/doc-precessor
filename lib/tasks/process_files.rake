require 'json'

namespace :files do
  namespace :data do 
    desc "Check files inside data/in directory and deploy in data/out"
    task :in => :environment do
      service = FileProcessorService.new
      service.process_in()
      # puts 'Init processing files...'
      # in_path = "#{ENV['HOME']}/data/in"
      # out_path = "#{ENV['HOME']}/data/out"
      # Dir.glob("#{in_path}/*.dat") do |f|
      #   Rails.logger
      #   puts "checking #{f}..."
      #   clients = []
      #   sellers = []
      #   sales  = []
      #   infos = Hash.new
      #   amount_sellers = 0
      #   amount_clients = 0
      #   File.open(f, 'r').each do |line|
      #     hash = Hash.new
      #     splitted = line.split('ç')
      #     case splitted[0] 
      #     when '001'
      #       hash['id'] = splitted[0]
      #       hash['CPF'] = splitted[1]
      #       hash['name'] = splitted[2]
      #       hash['salary'] = splitted[3]
      #       if sellers.exclude?(hash['CPF'])
      #         amount_sellers = amount_sellers + 1
      #       end
      #       sellers.push(hash)
      #     when '002'
      #       hash['id'] = splitted[0]
      #       hash['CNPJ'] = splitted[1]
      #       hash['name'] = splitted[2]
      #       hash['business_area'] = splitted[3]

      #       if clients.exclude?(hash['CNPJ'])
      #         amount_clients = amount_clients + 1
      #       end
      #       clients.push(hash)
      #     else
      #       hash['id'] = splitted[0] 
      #       hash['sale_id'] = splitted[1]
      #       hash['items'] = []
      #       items = splitted[2].gsub('[', '').gsub(']', '').split(',')
      #       sale_amount = 0
      #       items.each do |item|
      #         item_splitted = item.split('-')
      #         item_hash = Hash.new
      #         item_hash['id'] = item_splitted[0]
      #         item_hash['quantity'] = item_splitted[1]
      #         item_hash['price'] = item_splitted[2]
      #         sale_amount = sale_amount + item_splitted[2].to_f
      #         hash['items'].push(item_hash)
      #       end
      #       hash['salesman_name'] = splitted[3]
      #       hash['sale_amount'] = sale_amount
      #       sales.push(hash)
      #     end
      #   end
       
      #   infos[:amount_sellers] = amount_sellers
      #   infos[:amount_clients] = amount_clients
      #   infos[:best_sale] = sales.max { |a, b| a[:sale_amount] <=> b[:sale_amount]}
       
      #   Dir.chdir(out_path) do |path|
      #     file = File.basename(f, '.*')
      #     file = "#{file}.json"
      #     write = Hash.new
      #     write['clients'] = clients
      #     write['sellers'] = sellers
      #     write['sales'] = sales
      #     write['infos'] = infos
      #     puts "writing #{path}/#{file}..."
      #     file = File.new("#{path}/#{file}", 'w')
      #     file.write(write.to_json)
      #   end
      # end
    end
  end
end
