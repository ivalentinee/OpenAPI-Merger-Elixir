defmodule OpenapiMerger do
  @moduledoc """
  # OpenAPI Merger

  ## Installation

  Add to your `mix.exs`:

  ```elixir
  def deps do
    [
      {:openapi_merger, "0.1.0"}
    ]
  end
  ```

  ## Usage
  To merge your OpenAPI-specification parts into one json file simply run
  ```
  mix merge_openapi_specs --source ./documentation/ --dest ./priv/static/api.json
  ```
  Where `./documentation` is root directory with your specs and `./priv/static/api.json` is path for merged spec.
  """

  import OpenapiMerger.{Files, Merger}

  @default_error_message "Error: something went wrong"
  @source_invalid_message "Error: source path is not a directory"
  @dest_invalid_message "Error: dest path directory does not exist"
  @no_files_found_message "Error: no yaml/yml files found in source directory"

  @doc """
  Merges OpenAPI specs
  """
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
