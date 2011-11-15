require "net/http"

class SearchesController < ApplicationController
  
  def new
    api_key = "jRIQ4ebV34EDQ_9HjPZT6hcBgSmOkwMPiHgc8ns.P72O77XUWZUA_UpIfqIL_QfO" #found at http://developer.yahoo.com/search/local/V3/localSearch.html
    raw_data = Net::HTTP.get("local.yahooapis.com", "/LocalSearchService/V3/localSearch?appid=#{api_key}&query=starbucks&state=il&city=chicago&output=json") #this is found here --> http://ruby-doc.org/stdlib-1.9.3/libdoc/net/http/rdoc/Net/HTTP.html
    data = JSON.parse(raw_data) #placed into a local variable since it's not going to be referenced in the view 
    @items = data["ResultSet"]["Result"]
  end
  
end