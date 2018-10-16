defmodule OpenapiMergerElixir.Merger do
  def merge(paths) do
    Application.ensure_all_started(:yaml_elixir)

    document =
      paths
      |> read_files()
      |> merge_documents()

    {:ok, document}
  end

  def write_document(document, path) do
    rendered_document = Jason.encode!(document)
    File.write(path, rendered_document)
  end

  defp read_files(paths) do
    documents =
      Enum.map(paths, fn path ->
        case YamlElixir.read_from_file(path) do
          {:ok, document} ->
            document

          _ ->
            IO.puts("Warning: #{path} is invalid")
            nil
        end
      end)

    Enum.filter(documents, fn document -> !is_nil(document) end)
  end

  defp merge_documents(documents) do
    Enum.reduce(documents, &DeepMerge.deep_merge/2)
  end
end
