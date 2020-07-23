namespace :dev do
  desc "Sets up the development environment"
  task setup: :environment do
    puts %x(rails db:drop db:create db:migrate db:seed)
  end

end
