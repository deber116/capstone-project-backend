require 'net/http'
require 'uri'
require 'json'
require 'date'


uri = URI.parse("https://api.tcgplayer.com/token")
request = Net::HTTP::Post.new(uri)
request.set_form_data(
  "client_id" => "2b6898bd-638a-45d9-a2eb-c7ffbbf893be",
  "client_secret" => "fecc7bbe-b323-4afd-b016-c673dad402b5",
  "grant_type" => "client_credentials",
)

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end


puts JSON.parse(response.body)

# Public Key: 2b6898bd-638a-45d9-a2eb-c7ffbbf893be
# Private Key: fecc7bbe-b323-4afd-b016-c673dad402b5

{"access_token":"GvFa3UDTVhJqfcz90MBAB0IkjQLbNH1sVSO6S_iMB0qbf7YdOCekSYvOGsHbv8ui4QmL_ALCPggUJAVfnC8Z6XmbWlaz7wuG7XWYrBgW_0VthXe4Jf5DLF8BVS00ThIpNNJjnj7c6lYHWAHdHTrE-LS1TBTsgVzviTT9XZqUOkjTwpSx3Zs7nGqi8Ak5Gn_W7joNf_4WjZ7iSHhKKNic5pT9o3KsfcDwPDXots0fFxCeh4kBybd6HimBWcJYzkkYryvixnF3bwYOGozKctBlxbt8DYHAy7YeA8dAZreAb_JnkLEZ2e_ph_NVXrG03288Sy5XSw",
"token_type":"bearer",
"expires_in":1209599,
"userName":"2b6898bd-638a-45d9-a2eb-c7ffbbf893be",
".issued":"Tue, 12 May 2020 04:34:48 GMT",
".expires":"Tue, 26 May 2020 04:34:48 GMT"}

{"access_token":"9_fETokeva3cY9qR-JEDjrBE--RfPKMko9ZCdclb6N0f9S2PHpqLOnHL1bs9M8QOxyU_SY7qlpFcSQDCMNob4cl5b_AVSv_jgfTIitiwXW2seyd03_Iq9PF4IrOv7Ry7CCOy2wnxvaQlU-EjI9Sr6Vc0OeEe18vlY37uf6j2FO9eNNZSpIj5MoQrJ8T5Onw8NLkXTUulnnGx0yxXOtFQWHuOwZJkM4tFRFqaNFUUUnkNrCAf47nZHWu3wO8Iogq5pnrIl6ObNf86ZO6o-Sxoa8xsNCxpm6pDn3rRtDyIggc1OwIw9cx0boWK0ReyWgCroUcXdA",
"token_type":"bearer",
"expires_in":1209599,
"userName":"2b6898bd-638a-45d9-a2eb-c7ffbbf893be",
".issued":"Tue, 26 May 2020 05:36:47 GMT",
".expires":"Tue, 09 Jun 2020 05:36:47 GMT"}

{"access_token":"ftHxP1M48FLwHiWa41vTRYuPLGNs27uS3uAS9d4kk5k-Xu428-PrjfSXPM8sdV2hvF92aNBQ0AAtk7s7rW15rk9JlHKkGSEGOqzucW0w9QtM1gbwpAohh97WhS2_HhJSQDol04jKARKyXVt6icDB0s2ee_gijvtgOWXGWFuc8I_z_9yrwEV9HPhEpQrqgG2v6N6jYulLfahXoOscBBwtQrimMy-yOyBXrvlKkv-JxlISAcinCY0SNhFwM5YKWACo97_FktwrDwK7n40DKcxCYMda5pi0acaNqI0KBK70FX2yRsMdVh5CFXSXCYdvuNdcIb24lw",
"token_type":"bearer",
"expires_in":1209599,
"userName":"2b6898bd-638a-45d9-a2eb-c7ffbbf893be",
".issued":"Mon, 01 Jun 2020 01:47:38 GMT",
".expires":"Mon, 15 Jun 2020 01:47:38 GMT"}