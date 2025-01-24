defmodule ParserTest do
	use ExUnit.Case
	doctest Wreport

	import Wreport.XMLParser, only: [parse: 1]

	test "input xml is parsed and the map of values is returned" do
		contents = fetch_file_contents()
		assert create_map() == parse(contents)
	end

	def fetch_file_contents() do
		File.read!("./xml_response.xml")
	end

	def create_map() do
		%{
			"credit" => "NOAA's National Weather Service",
			"credit_URL" => "https://weather.gov/",
			"suggested_pickup" => "suggested_pickup",
			"suggested_pickup_period" => "60",
			"location" => "Denton Enterprise Airport, TX",
			"station_id" => "KDTO",
			"latitude" => "33.20505",
			"longitude" => "-97.20061",
			"observation_time" => "Last Update on Jan 22 2025, 10:53 am CST"
			"observation_time_rfc822" => "Wed, 22 Jan 2025 10:53:00 -0600",
			"temperature_string" => "37.9 F (3.3 C)"
			"temp_f" => "37.9",
			"temp_c" => "3.3",
			"relative_humidity" => "46",
			"wind_string" => "South at 19.6 MPH (17 KT)",
			"wind_dir" => "South",
			"wind_degrees" => "190",
			"wind_mph" => "19.6",
			"wind_kt" => "17",
			"pressure_string" => "1025.5 mb",
			"pressure_mb" => "025.5",
			"pressure_in" => "30.27",
			"dewpoint_string" => "19.0 F (-7.2 C)",
			"dewpoint_f" => "19.0",
			"dewpoint_c" => "-7.2",
			"windchill_string" => "29 F (-2 C)",
			"windchill_f" => "29",
			"windchill_c" => "-2",
			"visibility_mi" => "10.00",
			"icon_url_base" => "http://forecast.weather.gov/images/wtf/small/",
			"two_day_history_url" => "http://forecast.weather.gov/data/obhistory/KDTO.html",
			"icon_url_name" => "skc.png",
			"ob_url" => "http://forecast.weather.gov/data/METAR/KDTO.1.txt",
			"disclaimer_url" => "https://www.weather.gov/disclaimer.html",
			"copyright_url" => "https://www.weather.gov/disclaimer.html",
			"privacy_policy_url" => "https://www.weather.gov/notice.html"
		}
	end
end