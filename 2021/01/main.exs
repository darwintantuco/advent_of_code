"input.txt"
|> File.read!()
|> String.split("\n", trim: true)
|> Enum.map(&String.to_integer/1)
|> Enum.chunk_every(2, 1)
|> Enum.reduce(0, fn
  [reading_1, reading_2], acc when reading_2 > reading_1 -> acc + 1
  _readings, acc -> acc
end)
|> IO.inspect(label: "count")
