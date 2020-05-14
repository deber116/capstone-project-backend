require 'net/http'
require 'uri'

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

puts response.body

# Public Key: 2b6898bd-638a-45d9-a2eb-c7ffbbf893be
# Private Key: fecc7bbe-b323-4afd-b016-c673dad402b5

{"access_token":"GvFa3UDTVhJqfcz90MBAB0IkjQLbNH1sVSO6S_iMB0qbf7YdOCekSYvOGsHbv8ui4QmL_ALCPggUJAVfnC8Z6XmbWlaz7wuG7XWYrBgW_0VthXe4Jf5DLF8BVS00ThIpNNJjnj7c6lYHWAHdHTrE-LS1TBTsgVzviTT9XZqUOkjTwpSx3Zs7nGqi8Ak5Gn_W7joNf_4WjZ7iSHhKKNic5pT9o3KsfcDwPDXots0fFxCeh4kBybd6HimBWcJYzkkYryvixnF3bwYOGozKctBlxbt8DYHAy7YeA8dAZreAb_JnkLEZ2e_ph_NVXrG03288Sy5XSw",
"token_type":"bearer",
"expires_in":1209599,
"userName":"2b6898bd-638a-45d9-a2eb-c7ffbbf893be",
".issued":"Tue, 12 May 2020 04:34:48 GMT",
".expires":"Tue, 26 May 2020 04:34:48 GMT"}
