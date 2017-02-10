# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Sketch.create links: [{from: '1234', to: '5678', logic: 'toggle'}], boards: [{mac: '1234', centre: {x: 120, y: 120}, width: 40, height: 40}, {mac: '5678', centre: {x: 240, y: 120}, width: 40, height: 40}]
Sketch.create