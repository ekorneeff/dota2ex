defmodule Dota2ex.Client do
  use HTTPoison.Base

  @base_url "https://api.steampowered.com/"
  @api_version "v1"
  @api_key Application.fetch_env!(:dota2ex, :api_key)

  @matches_allowed_params ~w(league_id game_mode skill date_min date_max account_id start_at_match_id matches_requested tournament_games_only)

  def matches(id) when is_binary(id) do
    steam_request("IDOTA2Match_570", "GetMatchDetails", %{match_id: id})
  end

  def matches(params) when is_map(params) do
    steam_request("IDOTA2Match_570", "GetMatchHistory", Map.take(params, @matches_allowed_params))
  end

  def live do
    steam_request("IDOTA2Match_570", "GetLiveLeagueGames")
  end

  def leagues do
    steam_request("IDOTA2Match_570", "GetLeagueListing")
  end

  def steam_request(interface, method, params \\ %{}) do
    get!("/#{interface}/#{method}/#{@api_version}", json_headers(), params: Map.merge(params, %{key: @api_key}))
  end

  def process_url(url) do
    @base_url <> url
  end

  def process_response_body(body) do
    body
    |> Strip.strip_utf
    |> Jason.decode!()
  end

  def json_headers do
    %{"Content-Type" => "application/json"}
  end
end
