namespace :dev do
  desc "Sets up the development environment"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Deleting the database...")
      spinner.auto_spin
      %x(rails db:drop)
      spinner.success('(successful)')

      spinner = TTY::Spinner.new("[:spinner] Creating the database...")
      spinner.auto_spin
      %x(rails db:create)
      spinner.success('(successful)')

      spinner = TTY::Spinner.new("[:spinner] Migrating the tables...")
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success('(successful)')

      spinner = TTY::Spinner.new("[:spinner] Populating the database...")
      spinner.auto_spin
      %x(rails db:seed)      
      spinner.success('(successful)')
    else
      puts "Vocẽ não está em ambiente de devenvovimento."
    end
  end
end