lookup = "input.txt"
  |> File.read!()
  |> String.split("\n", trim: true)
  |> Enum.reduce(%{}, fn reading, acc ->
    reading
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index()
    |> Enum.reduce(acc, fn {bit, index}, acc ->
      if Map.has_key?(acc, index) do
        list = Map.get(acc, index)
        Map.replace(acc, index, [bit] ++ list)
      else
        Map.put_new(acc, index, [bit])
      end
    end)
  end)

gamma_rate = lookup
  |> Enum.reduce("", fn {_key, digits}, acc ->
    digits_length = length(digits)
    zero_count = Enum.count(digits, &(&1 == 0))
    bit = if (digits_length / 2) < zero_count, do: "1" , else: "0"
    acc <> bit
  end)
  |> String.split("", trim: true)
  |> Enum.map(&String.to_integer/1)
  |> Integer.undigits(2)

epsilon_rate = lookup
  |> Enum.reduce("", fn {_key, digits}, acc ->
    digits_length = length(digits)
    zero_count = Enum.count(digits, &(&1 == 0))
    bit = if (digits_length / 2) > zero_count, do: "1" , else: "0"
    acc <> bit
  end)
  |> String.split("", trim: true)
  |> Enum.map(&String.to_integer/1)
  |> Integer.undigits(2)

gamma_rate * epsilon_rate
|> IO.inspect()
