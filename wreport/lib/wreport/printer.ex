defmodule Wreport.Printer do

	@print_labels %{
					"credit_URL" => "Credit URL",
					"suggested_pickup" => "Suggested Pickup",
					"suggested_pickup_period" => "Suggested Pickup Period",
					"station_id" => "Station Code", 
					"observation_time" => "Observation Time",
					"observation_time_rfc822" => "Observation Time rfc822 format",
					"temperature_string" => "Temperature (Both Formats)",
					"temp_f" => "Temperature Farenheit",
					"temp_c" => "Temperature Celsius",
					"relative_humidity" => "Relative Humidity",
					"wind_string" => "Wind speed and direction",
					"wind_dir" => "Wind Direction",
					"wind_degrees" => "Wind angle(Degrees)",
					"wind_mph" => "Wind Speed (MPH)",
					"wind_kt" => "Wind Speed (Knots)",
					"pressure_string" => "Pressure",
					"pressure_mb" => "Pressure (Bars)",
					"pressure_in" => "Pressure (Inch)",
					"dewpoint_string" => "Dewpoint (Both Formats)",
					"dewpoint_f" => "DewPoint Farenheit",
					"dewpoint_c" => "Dewpoint Celsius",
					"windchill_string" => "Windchill (Both Formats)",
					"windchill_f" => "Windchill Farenheit",
					"windchill_c" => "Windchill Celsius",
					"visibility_mi" => "Visibility (Miles)",
					"two_day_history_url" => "Two Day History Details Link",
					"ob_url" => "Observation URL",
					"disclaimer_url" => "Disclaimer Link",
					"copyright_url" => "Copyright Link",
					"privacy_policy_url" => "Privacy Policy Link"
				}

	def print(values,columns) when is_map(values) and is_list(columns) do
		print_header(values)
		print_columns(values,columns)
	end

	def print_header(values) do
		IO.puts """
		Here is the weather data for #{Map.get(values,"station_id","")} - #{Map.get(values,"location","")} 
		"""
	end

	def print_columns(values,columns) do
		for column <- columns do
			print_value(values,column)
		end
	end

	def print_value(values, key) when is_map(values) and is_binary(key) do
		IO.puts """
		#{Map.get(@print_labels,key,key)} --> #{Map.get(values,key,"")}
		"""
	end
end