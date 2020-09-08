defmodule Bob do
  @message_types %{
    question: "Sure.",
    shout: "Whoa, chill out!",
    shouted_question: "Calm down, I know what I'm doing.",
    silence: "Fine. Be that way!",
    default: "Whatever."
  }

  def hey(input) do
    input
    |> String.trim()
    |> parse
  end

  defp parse(input) do
    cond do
      silence?(input) ->
        @message_types[:silence]

      question?(input) && shouted?(input) ->
        @message_types[:shouted_question]

      question?(input) ->
        @message_types[:question]

      shouted?(input) ->
        @message_types[:shout]

      true ->
        @message_types[:default]
    end
  end

  defp question?(input), do: String.ends_with?(input, "?")
  defp silence?(input), do: String.length(input) == 0

  defp shouted?(input) do
    input
    |> String.capitalize() != input &&
      input
      |> String.downcase() != input &&
      input
      |> String.upcase() == input
  end
end
