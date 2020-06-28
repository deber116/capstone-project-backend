
require 'net/http'
require 'uri'
require 'json'
require 'pp'
require 'date'

def check_auth_token 
    if ApiToken.all == [] || Date.parse(ApiToken.last.expiration_date) <= Date.today
        uri = URI.parse("https://api.tcgplayer.com/token")
        request = Net::HTTP::Post.new(uri)
        request.set_form_data(
            "client_id" => ENV["CLIENT_ID"],
            "client_secret" => ENV["CLIENT_SECRET"],
            "grant_type" => "client_credentials",
        )

        req_options = {
            use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
            http.request(request)
        end

        ApiToken.create(token: JSON.parse(response.body)["access_token"], expiration_date: JSON.parse(response.body)[".expires"])
    end
end

def pull_data(url)
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)
    request["Accept"] = "application/json"
    request["Authorization"] = "bearer #{ApiToken.last.token}"

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
        
        response = pull_data("https://api.tcgplayer.com/v1.32.0/catalog/groups?categoryId=2&offset=#{currentOffset}&limit=100")
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


def get_pricing_data_by_group(group)
    

    results = pull_data("https://api.tcgplayer.com/v1.32.0/pricing/group/#{group.group_id}")["results"]
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

def delete_old_price_data 
    Price.where('created_at < ?', 30.days.ago).each do |price|
        price.destroy
    end
end



def get_all_card_data
    Card.all.each {|c| c.destroy}

    maxOffset = 1000
    SetGroup.all.each do |booster|

        currentOffset = 0
        while currentOffset < maxOffset do
            response = pull_data("https://api.tcgplayer.com/v1.32.0/catalog/products?categoryId=2&groupId=#{booster.group_id}&getExtendedFields=true&offset=#{currentOffset}&limit=100")
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
                    when obj["name"] == "MonsterType"
                        monster_type = obj["value"]
                    when obj["name"] == "Attack"
                        attack = obj["value"].to_i
                    when obj["name"] == "Defense"
                        defense = obj["value"].to_i
                    end
                end 

                name = card["name"]
                group_id = card["groupId"].to_i
                img_url = card["imageUrl"]
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

check_auth_token
get_all_set_group_data
delete_old_price_data
get_all_card_data


