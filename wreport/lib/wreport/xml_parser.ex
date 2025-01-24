defmodule Wreport.XMLParser do
	require Logger

	@unwrapping_regex ~r"(\<\?xml.*?\>|\<current_observation.*?\>|\<\/current_observation.*?\>|\<image\>.*?\<\/image\>)"
	@splitting_regex ~r"\<\/.*?\>"
	@new_line_regex ~r"\n"


	def parse(xml_response) when is_binary(xml_response) do
		Logger.info("Response Length : #{String.length(xml_response)} ")
		xml_response
			|> remove_newline_character()
			|> unwrap_body()
			|> split_by_closing_tags
			|> create_map
	end

	def remove_newline_character(xml_response) when is_binary(xml_response) do
		String.replace(xml_response,@new_line_regex,"")
	end
	
	def unwrap_body(xml_response) when is_binary(xml_response) do
		String.replace(xml_response,@unwrapping_regex,"")
	end

	def split_by_closing_tags(unwrapped_body) do
		String.split(unwrapped_body,@splitting_regex)
	end

	def create_map(individual_tags) when is_list(individual_tags) do
		do_create_map(individual_tags,%{})
	end


	def do_create_map([head|tail],acc) do
		if String.length(head)<1 do
			do_create_map(tail,acc)
		end
		values = extract_tag_value(head)
		acc = Map.put_new(acc,Enum.at(values,0),Enum.at(values,1))
		do_create_map(tail,acc)
	end

	def do_create_map([],acc), do: acc

	def extract_tag_value(individual_tag) do
		individual_tag 
			|> String.replace(~r"\<","")
			|> String.split(~r"\>")
	end
end