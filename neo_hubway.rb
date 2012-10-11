require 'rubygems'
require 'neography'
require 'sinatra'
require 'oj'

def stations
  neo = Neography::Rest.new
  cypher = "START start_stations = node:Station(\"stationId:*\") 
            MATCH start_stations <-[:`START`]- trips -[:END]-> end_stations
            RETURN start_stations.name, end_stations.name, COUNT(*) AS cnt
            ORDER BY cnt DESC
            LIMIT 200"
  neo.execute_query(cypher)["data"]            
end

get '/visualization' do
  results = stations
  results.group_by(&:first).map {|k,v| {"name" => k, "follows" => v.collect{|n| { "name" => n[1], "counts" => n[2] }}}}.to_json
end
