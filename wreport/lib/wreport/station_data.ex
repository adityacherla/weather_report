defmodule Wreport.StationData do
	require Logger

	@user_agent [{"User-agent","Mozilla/5.0 (X11; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0"}]
	@weather_url Application.compile_env(:wreport, :weather_url)


	def fetch(station_code) do
		Logger.info("Fetching #{station_code}'s latest weather data")

		wreport_url(station_code)
		|> HTTPoison.get(@user_agent)
		|> handle_response
	end

	def wreport_url(station_code) do
		"#{@weather_url}/#{station_code}.xml"
	end

	def handle_response({_ ,%{status_code: status_code, body: body}}) do
		Logger.info("Got Response: status_code=#{status_code}")

		Logger.debug(fn -> inspect(body) end)
		
		{check_for_error(status_code), body}
						
	end

	defp check_for_error(200), do: :ok
	defp check_for_error(_), do: :error 

end