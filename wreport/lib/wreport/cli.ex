defmodule Wreport.CLI do
	
@moduledoc """
Handle the command line parsing and the dispatch to
various functions that end up generating a table of
weather information
"""

import Wreport.XMLParser, only: [ parse: 1]
import Wreport.Printer, only: [print: 2]

@output_columns ["credit","location","station_id","latitude","longitude","observation_time","temperature_string","relative_humidity","wind_string","pressure_string","dewpoint_string","windchill_string","visibility_mi","two_day_history_url"]

def main(argv) do
	argv
	|>parse_args()
	|>process
end

@doc """
This method parses the arguments provided to the CLI command.
argv can be -h or -help, which returns :help .

Otherwise it is name of the station for which the weather information
needs to be extracted.

"""
def parse_args(argv) do
	OptionParser.parse(argv, switches: [help: :boolean],aliases: [h: :help])
	|> elem(1)
	|> args_to_internal_representation()
end

def args_to_internal_representation([station]) do
	station
end

def args_to_internal_representation(_) do
	:help
end

def process(:help) do
	IO.puts """
	usage wreport <station_code>
	"""
	System.halt(0)
end

def process(station) do
	Wreport.StationData.fetch(station)
	|> decode_response()
	|> parse()
	|> print(@output_columns)
end

def decode_response({:ok,body}), do: body

def decode_response({:error,error}) do
	IO.puts """
	Error fetching weather data #{error["message"]}
	"""
	System.halt(2)
end


end