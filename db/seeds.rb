
require 'net/http'
require 'uri'
require 'json'
require 'pp'

def pull_data(url)
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)
    request["Accept"] = "application/json"
    request["Authorization"] = "bearer GvFa3UDTVhJqfcz90MBAB0IkjQLbNH1sVSO6S_iMB0qbf7YdOCekSYvOGsHbv8ui4QmL_ALCPggUJAVfnC8Z6XmbWlaz7wuG7XWYrBgW_0VthXe4Jf5DLF8BVS00ThIpNNJjnj7c6lYHWAHdHTrE-LS1TBTsgVzviTT9XZqUOkjTwpSx3Zs7nGqi8Ak5Gn_W7joNf_4WjZ7iSHhKKNic5pT9o3KsfcDwPDXots0fFxCeh4kBybd6HimBWcJYzkkYryvixnF3bwYOGozKctBlxbt8DYHAy7YeA8dAZreAb_JnkLEZ2e_ph_NVXrG03288Sy5XSw"

    req_options = {
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
    end

    JSON.parse(response.body)

end

def get_all_set_group_data
    SetGroup.all.each {|sg| sg.destroy}
    maxOffset = 1000
    currentOffset = 0
    while currentOffset < maxOffset do
        
        response = pull_data("http://api.tcgplayer.com/v1.32.0/catalog/groups?categoryId=2&offset=#{currentOffset}&limit=100")
        results = response["results"]

        #API only allows 100 results at a time. Need to calculate the number of offsets and redeclare variable used in loop
        maxOffset = (((response["totalItems"].to_f) / 100).ceil()) * 100

        results.each do |booster| 
            name = booster["name"]
            group_id = booster["groupId"].to_i
            SetGroup.create(name: name, group_id: group_id)
        end

        currentOffset += 100
    end  
end

get_all_set_group_data

def get_pricing_data_by_group(group)

    results = pull_data("http://api.tcgplayer.com/v1.32.0/pricing/group/#{group.group_id}")["results"]
    results.each do |price|
        updatedPrice = nil
        if price["marketPrice"]
            updatedPrice = price["marketPrice"]
        else 
            updatedPrice = price["midPrice"]
        end
        Price.create(amount: updatedPrice, product_id: price["productId"], edition: price["subTypeName"])
    end
end



def get_all_card_data
    Card.all.each {|c| c.destroy}

    secret_slayers = SetGroup.find_by(name: "Secret Slayers")
    eternity_code = SetGroup.find_by(name: "Eternity Code")
    ignition_assault = SetGroup.find_by(name: "Ignition Assault")
    rising_rampage = SetGroup.find_by(name: "Rising Rampage")
    dark_neostorm = SetGroup.find_by(name: "Dark Neostorm")
    savage_strike = SetGroup.find_by(name: "Savage Strike")
    soul_fusion = SetGroup.find_by(name: "Soul Fusion")
    flames_of_destruction = SetGroup.find_by(name: "Flames of Destruction")

    selected_sets = [secret_slayers, eternity_code, ignition_assault, rising_rampage, dark_neostorm, savage_strike, soul_fusion, flames_of_destruction]

    maxOffset = 1000
    selected_sets.each do |booster|

        currentOffset = 0
        while currentOffset < maxOffset do
            response = pull_data("http://api.tcgplayer.com/v1.32.0/catalog/products?categoryId=2&groupId=#{booster.group_id}&getExtendedFields=true&offset=#{currentOffset}&limit=100")
            results = response["results"]

            maxOffset = (((response["totalItems"].to_f) / 100).ceil()) * 100

            results.each do |card| 
                rarity = nil
                attrbute = nil
                card_type = nil
                description = nil
                monster_type = nil
                attack = nil
                defense = nil

                extended_data = card["extendedData"].each do |obj|
                    case
                    when obj["name"] == "Rarity"
                        rarity = obj["value"]
                    when obj["name"] == "Attribute"
                        attrbute = obj["value"]
                    when obj["name"] == "Card Type"
                        card_type = obj["value"]
                    when obj["name"] == "Description"
                        description = obj["value"]
                    when obj["name"] == "Monster Type"
                        monster_type = obj["value"]
                    when obj["name"] == "Attack"
                        attack = obj["value"].to_i
                    when obj["name"] == "Defense"
                        defense = obj["value"].to_i
                    end
                end 

                name = card["name"]
                group_id = card["groupId"].to_i
                img_url = card["url"]
                product_id = card["productId"].to_i

                Card.create(
                    product_id: product_id, 
                    name: name, 
                    group_id: group_id, 
                    img_url: img_url, 
                    rarity: rarity, 
                    attrbute: attrbute,
                    card_type: card_type,
                    description: description,
                    monster_type: monster_type,
                    attack: attack,
                    defense: defense
                )
            end

            currentOffset += 100
        end
        
        get_pricing_data_by_group(booster)
    end
end

get_all_card_data

