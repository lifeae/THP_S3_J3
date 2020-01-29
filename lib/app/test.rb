# Test stockage dans un .json
require 'pry'
require 'json'

data = [{"ABLEIGES"=>"mairie.ableiges95@wanadoo.fr"}, {"AINCOURT"=>"mairie.aincourt@wanadoo.fr"}, {"AMBLEVILLE"=>"mairie.ambleville@wanadoo.fr"}]

binding.pry 

File.open("/home/lifeae/Dropbox/thehackingproject/S3/J3/db/emails.json","w") do |f|
  f.write(data.to_json)
end
