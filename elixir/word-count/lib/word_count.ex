defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> strip_punctuation
    |> retrieve_words
    |> Enum.frequencies()
  end

  defp strip_punctuation(sentence) do
    Regex.replace(~r/[^[:alnum:]-]/u, sentence, " ")
  end

  defp retrieve_words(sentence) do
    ~w/#{sentence}/
  end
end
