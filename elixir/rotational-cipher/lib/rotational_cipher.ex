defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> Enum.map(fn char -> 
      cond do
        is_lower_case?(char) -> rotate_lower_case(char, shift)
        is_upper_case?(char) -> rotate_upper_case(char, shift)
        true -> char
      end
    end)
    |> to_string
  end

  defp is_lower_case?(char), do: char >= 97 && char <= 122
  defp is_upper_case?(char), do: char >= 66 && char <= 90

  defp rotate_lower_case(char, shift), do: 97 + rem(char - 71 + shift, 26)
  defp rotate_upper_case(char, shift), do: 65 + rem(char - 39 + shift, 26)
end
