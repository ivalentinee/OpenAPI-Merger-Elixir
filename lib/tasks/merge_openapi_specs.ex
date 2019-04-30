defmodule Mix.Tasks.MergeOpenapiSpecs do
  @moduledoc "mix merge_openapi_specs --source <source-directory> --dest <dest-file-path>"

  use Mix.Task

  @source_option_name :source
  @dest_option_name :dest
  @options [{@source_option_name, :string}, {@dest_option_name, :string}]
  @invalid_options_message "Options \"--#{@source_option_name}\" and \"--#{@dest_option_name}\" are required"

  @shortdoc "Merges openapi .yml files"
  def run(_) do
    options = task_arguments()

    if valid_options?(options) do
      OpenapiMerger.merge_openapi_specs(options[:source], options[:dest])
    else
      IO.puts(@invalid_options_message)
    end
  end

  defp task_arguments do
    {parsed_options, _, _} = OptionParser.parse(System.argv(), strict: @options)
    parsed_options
  end

  defp valid_options?(options) when is_list(options) do
    Keyword.has_key?(options, @source_option_name) && Keyword.has_key?(options, @dest_option_name)
  end

  defp valid_options?(_), do: false
end
