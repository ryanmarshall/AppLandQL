# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client = Client.create(name: "Candid Development")
app = App.create(client: client, name: 'appmap-java', url:'https://github.com/appland/appmap-java', auth_provider: SecureRandom.hex)

