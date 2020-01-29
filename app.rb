require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../", __FILE__)
require 'lib/app/scrapper.rb'

def menu1
  puts "Bienvenue dans cette application qui va aller scrapper les mails des mairies du Val-d'Oise."
  puts "Que souhaitez-vous faire ?"
  puts "1- Scrapper les données."
  puts "2- Quitter l'application."
  print ">"
  user_choice = gets.chomp.to_i
  case user_choice
  when 1
    puts "Scrap des données en cours ..."
    data = Scrapper.new.perform
    print "\n\n\n"
    return data
  when 2
    exit
  else
    menu1
  end
end

def menu2
  puts "Sous quel format souhaitez-vous enregistrer les données ?"
  puts "Rentrez le numéro de l'option qui vous convient :"
  puts "1- .json"
  puts "2- Google Spreadsheet"
  puts "3- .csv"
  puts "Si vous souhaitez quitter le programme, entrez : 4."
  print ">"
  user_choice = gets.chomp.to_i
  case user_choice
  when 1
    puts "Vous avez choisi d'enregistrer les données sous le format .json"
    data_json = Scrapper.new.save_as_JSON(data)
    puts "Vous retrouverez votre fichier à l'adresse suivante : db/emails.json"
  when 2
    puts "Vous avez choisi d'enregistrer les données sous le format Google Spreadsheet"
    data_spreadsheet = Scrapper.new.save_as_spreadsheet(data)
    puts "Vous retrouverez votre fichier à l'adresse suivante : ..."
  when 3
    puts "Vous avez choisi d'enregistrer les données sous le format .csv"
    data_csv = Scrapper.new.save_as_csv(data)
    puts "Vous retrouverez votre fichier à l'adresse suivante : db/emails.csv"
  when 4
    exit
  else
    puts "Votre entrée n'est pas reconnue."
    menu2
  end
end

menu1
menu2

#data = Scrapper.new.perform
#data_json = Scrapper.new.save_as_JSON(data)

binding.pry
