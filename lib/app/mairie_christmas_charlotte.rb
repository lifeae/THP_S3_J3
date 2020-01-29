require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'



def get_townhall_email
 email_town = []
 doc = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
 doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
   email_town << node.text
 end 
 puts email_town
end 


def get_townhall_urls
  url_town = []
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  doc.xpath('//a[@class = "lientxt"]').each do |node|
   url_town << node["href"]
 end
 return url_town
end 


def get_all_townhall_email (url_town)
  email_all = []
  url_town.each do |town|
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{town}"))
  doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
   email_all << node.text
 end
 end
 return email_all
end 


def get_town_name
 name_town = []
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  doc.xpath('//a[@class = "lientxt"]').each do |node|
   name_town << node.text
 end
 return name_town
end 


def create_array_town (name_town, email_all)
  array_of_hashes = Array.new

  (0...name_town.size).each do |num|
    key = name_town[num]
    value = email_all[num]
    result = Hash.new
    result[key]= value
    array_of_hashes << result
  end
  print array_of_hashes
  return array_of_hashes
end


def perform
  url_town = get_townhall_urls
  email_all = get_all_townhall_email(url_town)
  name_town = get_town_name
  create_array_town(name_town, email_all)
end

perform