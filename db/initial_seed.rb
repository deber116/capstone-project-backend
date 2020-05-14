require 'net/http'
require 'uri'
require 'json'
require 'pp'

uri = URI.parse("http://api.tcgplayer.com/v1.32.0/catalog/products?categoryId=2&groupId=2613&getExtendedFields=true&offset=0&limit=1")
request = Net::HTTP::Get.new(uri)
request["Accept"] = "application/json"
request["Authorization"] = "bearer GvFa3UDTVhJqfcz90MBAB0IkjQLbNH1sVSO6S_iMB0qbf7YdOCekSYvOGsHbv8ui4QmL_ALCPggUJAVfnC8Z6XmbWlaz7wuG7XWYrBgW_0VthXe4Jf5DLF8BVS00ThIpNNJjnj7c6lYHWAHdHTrE-LS1TBTsgVzviTT9XZqUOkjTwpSx3Zs7nGqi8Ak5Gn_W7joNf_4WjZ7iSHhKKNic5pT9o3KsfcDwPDXots0fFxCeh4kBybd6HimBWcJYzkkYryvixnF3bwYOGozKctBlxbt8DYHAy7YeA8dAZreAb_JnkLEZ2e_ph_NVXrG03288Sy5XSw"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

#all sets = http://api.tcgplayer.com/v1.32.0/catalog/groups?categoryId=2&isSupplemental=true
#Individual card info = "http://api.tcgplayer.com/v1.32.0/catalog/products?categoryId=2&productName=Adamancipator%20Researcher
#pricing for individual card = http://api.tcgplayer.com/v1.32.0/pricing/product/211605
#set details = http://api.tcgplayer.com/v1.32.0/catalog/groups/2613
#all cards DETAILED = http://api.tcgplayer.com/v1.32.0/catalog/products?categoryId=2&getExtendedFields=true

#492 Sets
response.code
pp JSON.parse(response.body)
# ["results"].map do |booster| 
#   name = booster["name"]
#   group_id = booster["groupId"]
#   SetGroup.create(name: name, group_id: group_id)
# end










#http://api.tcgplayer.com/v1.32.0/catalog/products?categoryId=2&getExtendedFields=true&limit=26922

#all cards DETAILED = http://api.tcgplayer.com/v1.32.0/catalog/products?categoryId=2&getExtendedFields=true
#RESPONSE:
# {"success"=>true,
#  "errors"=>[],
#  "results"=>
#   [{"productId"=>21720,
#     "name"=>"A Feint Plan",
#     "cleanName"=>"A Feint Plan",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21720_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>243,
#     "url"=>
#      "https://store.tcgplayer.com/yugioh/legacy-of-darkness/a-feint-plan",
#     "modifiedOn"=>"2018-10-19T14:59:47.873",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"LOD-032"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"TRAP"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Normal Trap"},
#       {"name"=>"Attack", "displayName"=>"Attack", "value"=>"0"},
#       {"name"=>"Defense", "displayName"=>"Defense", "value"=>"0"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "A player cannot attack face-down monsters during this turn."}]}]}
# [23:20:22] capstone-project
# // ♥ ruby ./app/API_pull_test.rb
# {"totalItems"=>26922,
#  "success"=>true,
#  "errors"=>[],
#  "results"=>
#   [{"productId"=>21715,
#     "name"=>"4-Starred Ladybug of Doom",
#     "cleanName"=>"4 Starred Ladybug of Doom",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21715_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>259,
#     "url"=>
#      "https://store.tcgplayer.com/yugioh/pharaohs-servant/4-starred-ladybug-of-doom",
#     "modifiedOn"=>"2017-09-18T20:18:16.78",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"PSV-088"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"WIND"},
#       {"name"=>"MonsterType",
#        "displayName"=>"Monster Type",
#        "value"=>"Insect"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Effect Monster"},
#       {"name"=>"Attack", "displayName"=>"Attack", "value"=>"800"},
#       {"name"=>"Defense", "displayName"=>"Defense", "value"=>"1200"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "FLIP: Destroys all face-up Level 4 monsters on your opponent''s side of the field."}]},
#    {"productId"=>21716,
#     "name"=>"7 Colored Fish",
#     "cleanName"=>"7 Colored Fish",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21716_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>255,
#     "url"=>"https://store.tcgplayer.com/yugioh/metal-raiders/7-colored-fish",
#     "modifiedOn"=>"2013-05-09T12:13:41.653",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"MRD-098"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"WATER"},
#       {"name"=>"MonsterType", "displayName"=>"Monster Type", "value"=>"Fish"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Normal Monster"},
#       {"name"=>"Attack", "displayName"=>"Attack", "value"=>"1800"},
#       {"name"=>"Defense", "displayName"=>"Defense", "value"=>"800"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "A rare rainbow fish that has never been caught by mortal man."}]},
#    {"productId"=>21717,
#     "name"=>"7 Completed",
#     "cleanName"=>"7 Completed",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21717_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>259,
#     "url"=>"https://store.tcgplayer.com/yugioh/pharaohs-servant/7-completed",
#     "modifiedOn"=>"2013-05-09T12:13:41.653",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"PSV-004"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"SPELL"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Equip Spell"},
#       {"name"=>"Attack", "displayName"=>"Attack", "value"=>"0"},
#       {"name"=>"Defense", "displayName"=>"Defense", "value"=>"0"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "A Machine-Type monster equipped with this card increases either its ATK or DEF by 700 points. You cannot change your choice as long as this card remains face-up on the field."}]},
#    {"productId"=>21718,
#     "name"=>"8-Claws Scorpion",
#     "cleanName"=>"8 Claws Scorpion",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21718_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>260,
#     "url"=>
#      "https://store.tcgplayer.com/yugioh/pharaonic-guardian/8-claws-scorpion",
#     "modifiedOn"=>"2013-05-09T12:13:41.653",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"PGD-024"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"DARK"},
#       {"name"=>"MonsterType",
#        "displayName"=>"Monster Type",
#        "value"=>"Insect"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Effect Monster"},
#       {"name"=>"Attack", "displayName"=>"Attack", "value"=>"300"},
#       {"name"=>"Defense", "displayName"=>"Defense", "value"=>"200"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "You can flip this card into face-down Defense Position once per turn during your Main Phase. When this card targets a face-down Defense Position monster on your opponent''s side of the field in battle, the ATK of this card becomes 2400 during that damage step calculation only."}]},
#    {"productId"=>21719,
#     "name"=>"A Cat of Ill Omen",
#     "cleanName"=>"A Cat of Ill Omen",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21719_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>260,
#     "url"=>
#      "https://store.tcgplayer.com/yugioh/pharaonic-guardian/a-cat-of-ill-omen",
#     "modifiedOn"=>"2017-09-18T20:19:10.067",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"PGD-070"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"DARK"},
#       {"name"=>"MonsterType", "displayName"=>"Monster Type", "value"=>"Beast"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Effect Monster"},
#       {"name"=>"Attack", "displayName"=>"Attack", "value"=>"500"},
#       {"name"=>"Defense", "displayName"=>"Defense", "value"=>"300"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "FLIP: Select 1 Trap Card from your Deck and place it on top of your Deck. If Necrovalley is active on the field, you can add the selected card to your hand."}]},
#    {"productId"=>21720,
#     "name"=>"A Feint Plan",
#     "cleanName"=>"A Feint Plan",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21720_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>243,
#     "url"=>
#      "https://store.tcgplayer.com/yugioh/legacy-of-darkness/a-feint-plan",
#     "modifiedOn"=>"2018-10-19T14:59:47.873",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"LOD-032"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"TRAP"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Normal Trap"},
#       {"name"=>"Attack", "displayName"=>"Attack", "value"=>"0"},
#       {"name"=>"Defense", "displayName"=>"Defense", "value"=>"0"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "A player cannot attack face-down monsters during this turn."}]},
#    {"productId"=>21721,
#     "name"=>"A Legendary Ocean",
#     "cleanName"=>"A Legendary Ocean",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21721_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>243,
#     "url"=>
#      "https://store.tcgplayer.com/yugioh/legacy-of-darkness/a-legendary-ocean",
#     "modifiedOn"=>"2018-10-19T15:07:41.08",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"LOD-078"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"SPELL"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Field Spell"},
#       {"name"=>"Attack", "displayName"=>"Attack", "value"=>"0"},
#       {"name"=>"Defense", "displayName"=>"Defense", "value"=>"0"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "This card's name is treated as Umi. Downgrade all WATER monsters in both player's hands and on the field by 1 Level. Increases the ATK and DEF of all WATER monsters by 200 points."}]},
#    {"productId"=>21722,
#     "name"=>"A Man with Wdjat",
#     "cleanName"=>"A Man with Wdjat",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21722_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>260,
#     "url"=>
#      "https://store.tcgplayer.com/yugioh/pharaonic-guardian/a-man-with-wdjat",
#     "modifiedOn"=>"2013-05-09T12:13:41.653",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"PGD-068"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"DARK"},
#       {"name"=>"MonsterType",
#        "displayName"=>"Monster Type",
#        "value"=>"Spellcaster"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Effect Monster"},
#       {"name"=>"Attack", "displayName"=>"Attack", "value"=>"1600"},
#       {"name"=>"Defense", "displayName"=>"Defense", "value"=>"1600"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "When you Normal Summon this monster and during each of your following Standby Phases as long as this card remains face-up on the field, select 1 Set card on your opponent''s side of the field and see it. Return the card to its original position."}]},
#    {"productId"=>21723,
#     "name"=>"A Wingbeat of Giant Dragon",
#     "cleanName"=>"A Wingbeat of Giant Dragon",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21723_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>243,
#     "url"=>
#      "https://store.tcgplayer.com/yugioh/legacy-of-darkness/a-wingbeat-of-giant-dragon",
#     "modifiedOn"=>"2018-10-19T15:14:11.04",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"LOD-044"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"SPELL"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Normal Spell"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "Return 1 face-up Level 5 or higher Dragon-Type monster on your side of the field to the owner's hand and destroy all Magic and Trap Cards on the field"}]},
#    {"productId"=>21724,
#     "name"=>"Adhesion Trap Hole",
#     "cleanName"=>"Adhesion Trap Hole",
#     "imageUrl"=>
#      "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/21724_200w.jpg",
#     "categoryId"=>2,
#     "groupId"=>250,
#     "url"=>
#      "https://store.tcgplayer.com/yugioh/magicians-force/adhesion-trap-hole",
#     "modifiedOn"=>"2017-09-18T20:20:05.51",
#     "imageCount"=>1,
#     "presaleInfo"=>{"isPresale"=>false, "releasedOn"=>nil, "note"=>nil},
#     "extendedData"=>
#      [{"name"=>"Number", "displayName"=>"Number", "value"=>"MFC-050"},
#       {"name"=>"Rarity", "displayName"=>"Rarity", "value"=>"Common"},
#       {"name"=>"Attribute", "displayName"=>"Attribute", "value"=>"TRAP"},
#       {"name"=>"Card Type",
#        "displayName"=>"Card Type",
#        "value"=>"Normal Trap"},
#       {"name"=>"Attack", "displayName"=>"Attack", "value"=>"0"},
#       {"name"=>"Defense", "displayName"=>"Defense", "value"=>"0"},
#       {"name"=>"Description",
#        "displayName"=>"Description",
#        "value"=>
#         "You can only activate this card when your opponent successfully Normal Summons, Flip Summons, or Special Summons a monster. As long as that monster remains face-up on the field, the original ATK of the monster is halved."}]}]}