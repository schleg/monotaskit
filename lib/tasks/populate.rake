begin
  namespace :db do
    desc "Populate the development database with some fake data"
    task :populate => :environment do
      5.times do
        start_date = DateTime.now - rand(365) + 30
        end_date = start_date + rand(365) + 30
        Project.create! :name => Forgery::LoremIpsum.sentences(quantity=80).split('. ')[rand(79)],
        :user_id => User.first.id, :amount => rand(145000) + 5000, :po_number => rand(5000), 
        :company_name => Forgery::Name.company_name, :sponsor => Forgery::Internet.user_name, 
        :start_date => start_date, :end_date => end_date
      end
    end
  end
rescue LoadError
  puts "Please run: sudo gem install forgery"
end