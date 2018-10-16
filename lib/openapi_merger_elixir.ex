defmodule OpenapiMergerElixir do
  @moduledoc """
  Documentation for OpenapiMergerElixir.
  """

  import OpenapiMergerElixir.{Files, Merger}

  @default_error_message "Error: something went wrong"
  @source_invalid_message "Error: source path is not a directory"
  @dest_invalid_message "Error: dest path directory does not exist"
  @no_files_found_message "Error: no yaml/yml files found in source directory"

  def merge_openapi_specs(source_path, dest_path) do
    with :ok <- source_valid?(source_path),
         :ok <- dest_valid?(dest_path),
         {:ok, files} <- source_files(source_path),
         {:ok, document} <- merge(files) do
      write_document(document, dest_path)
      IO.puts('API json merged to #{dest_path}')
    else
      error -> print_error(error)
    end
  end

  defp print_error({:error, :source_invalid}), do: IO.puts(@source_invalid_message)
  defp print_error({:error, :dest_invalid}), do: IO.puts(@dest_invalid_message)
  defp print_error({:error, :no_files_found}), do: IO.puts(@no_files_found_message)
  defp print_error(_), do: IO.puts(@default_error_message)
end
