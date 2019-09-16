require 'json'

class FileReaderService
  $out_path = "#{ENV['HOME']}/data/out"
  $in_path = "#{ENV['HOME']}/data/in"

  def self.get_out_documents()
    if Dir.exist?($out_path)
      docs = Dir.children($out_path)
      docs
    else
      {}
    end
  end

  def self.get_in_documents
    if Dir.exist?($in_path)
      docs = Dir.children($in_path)
      docs
    else
      {}
    end
  end

  def self.get_out_document(doc_name)
    Dir.chdir($out_path) do |path|
      filePath = "#{path}/#{doc_name}.json"
      if(File.exist?(filePath))
        file = File.open(filePath, 'r')
        file.read
      else
        {}
      end
    end
  end

  def self.get_in_document(doc_name)
    Dir.chdir($in_path) do |path|
      filePath = "#{path}/#{doc_name}.dat"
      if(File.exist?(filePath))
        # file = File.open(filePath, 'r')
        hash = Hash.new
        hash[:lines] = File.readlines(filePath)
        hash
      else
        {}
      end
    end
  end
end