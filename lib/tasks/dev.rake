namespace :dev do
  desc "Sets up the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting the database...","database successfully deleted!") { %x(rails db:drop) }
      show_spinner("Creating the database...","database successfully created!") {  %x(rails db:create) }
      show_spinner("Migrating the tables...","successful migration!") { %x(rails db:migrate) }
      show_spinner("Populating the database...","database successfully populated") { %x(rails db:seed) }
    else
      puts "Vocẽ não está em ambiente de devenvovimento."
    end
  end

  def show_spinner(start_msg, end_msg)
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    spinner.auto_spin
    yield
    spinner.success("(#{end_msg})")
  end
end