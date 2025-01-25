defmodule CliTest do
	use ExUnit.Case
	doctest Wreport

	import Wreport.CLI, only: [parse_args: 1]

	test ":help returned by option parsing with -h and -help options" do
		assert parse_args(["-h"]) == :help
		assert parse_args(["-help"]) == :help
	end

	test "station code returned when code is given" do
		assert parse_args(["KDTO"]) == "KDTO"
	end

end