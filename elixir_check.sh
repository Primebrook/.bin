#!/bin/zsh

# Example check script for Elixir/Phoenix projects
echo "Running checks for Elixir/Phoenix project..."

mix test
mix format
mix credo
mix dialyzer

