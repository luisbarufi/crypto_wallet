namespace :dev do
  desc "Sets up the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting the database...") { %x(rails db:drop) }
      show_spinner("Creating the database...") {  %x(rails db:create) }
      show_spinner("Migrating the tables...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Vocẽ não está em ambiente de devenvovimento."
    end
  end

  desc "Registering the coins"
  task add_coins: :environment do
    show_spinner("Registering the coins...") do
      coins = [
                {
                  description: "Bitcoin",
                  acronym: "BTC",
                  url_image: "https://cdn.xbinop.com/br/wp-content/uploads/sites/8/2017/12/bitcoin.png"
                },
                {
                  description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://foxbit.com.br/wp-content/uploads/2019/01/Ethereum-01.png"
                },
                {
                  description: "Dash",
                  acronym: "DASH",
                  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/660.png"
                },
                {
                  description: "Iota",
                  acronym: "IOT",
                  url_image: "https://www.coinstaker.com/wp-content/uploads/2018/01/iota-cryptocurrency-logo-1.png"
                },
                {
                  description: "Zcash",
                  acronym: "ZEC",
                  url_image: "https://z.cash/wp-content/uploads/2018/10/zcash-logo-fullcolor-512sq.png"
                }
              ]
    
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Registered types of mining"
  task add_mining_types: :environment do
    show_spinner("Registered types of mining...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(start_msg, end_msg = "successfully!")
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    spinner.auto_spin
    yield
    spinner.success("(#{end_msg})")
  end
end