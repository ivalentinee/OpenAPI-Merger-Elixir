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
