# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_image: "https://cdn.xbinop.com/br/wp-content/uploads/sites/8/2017/12/bitcoin.png"
)

Coin.create!(
  description: "Ethereum",
  acronym: "ETH",
  url_image: "https://foxbit.com.br/wp-content/uploads/2019/01/Ethereum-01.png"
)

Coin.create!(
  description: "Dash",
  acronym: "DASH",
  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/660.png"
)
