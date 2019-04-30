defmodule OpenapiMerger.Files do
  @moduledoc false

  def source_files(source_path) do
    wildcard = Path.join(source_path, "/**/*.{yml,yaml,json}")
    files = Path.wildcard(wildcard)

    if Enum.any?(files) do
      {:ok, files}
    else
      {:error, :no_files_found}
    end
  end

  def source_valid?(source_path) do
    if File.dir?(source_path) do
      :ok
    else
      {:error, :source_invalid}
    end
  end

  def dest_valid?(dest_path) do
    if File.dir?(Path.dirname(dest_path)) do
      :ok
    else
      {:error, :dest_invalid}
    end
  end
end
