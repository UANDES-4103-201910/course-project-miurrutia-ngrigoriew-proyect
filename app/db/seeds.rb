# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name:"Ignacia", lastname:"Urrutia", phone:123456789, email:"miurrutia2@miuandes.cl", password:"ignacia12345", set: nil, city:"Santiago", bl: false, aup: true , tos: true)
user2 = User.create(name:"Nicolas", lastname:"Grigoriew", phone:987654321, email:"nmgrigoriewdensol@miuandes.cl", password:"nicolas12345",set:nil, city:"Islas Malvinas", bl: true, aup: true , tos: true)
admin1 = User.create(name:"Benjamin", lastname:"Fuentes", email:"admin@miuandes.cl", password:"hola123456",set:1, city:"Santiago", bl: false, aup: true , tos: true)
superadmin1 = User.create(name:"Sofia", lastname:"Pavicevic", email:"sadmin@miuandes.cl", password:"hola654321",set:2, city:"Arica", bl: false, aup: true , tos: true)

post1 = Post.create(user_id:user1.id,title:"car parked wrongly", description:"Stupid owner", city:"Santiago", status:1, ds: false)
post2 = Post.create(user_id:user2.id,title:"Watch out in parking lot", description:"Hatefull community", city:"Santiago", status:1, ds: false)
post3 = Post.create(user_id:user1.id,title:"Things i hate", description:"Stupid people", city:"Arica", status:1, ds: true)
post4 = Post.create(user_id:user2.id,title:"Things i hate the most", description:"Chimichurri", city:"Concepcion", status:1, ds: false)
post5 = Post.create(user_id:user1.id,title:"Things i hate less", description:"Cats", city:"Islas Malvinas", status:1, ds: false)


comment1 = Comment.create(user_id:user2.id, post_id:post1.id)



dp1 = Dumpster.create(post_id:post2.id)

bl1 =Blacklist.create(user_id:user1.id)