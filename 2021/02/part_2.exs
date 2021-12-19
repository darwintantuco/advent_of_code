"input.txt"
|> File.read!()
|> String.split("\n", trim: true)
|> Enum.reduce({0, 0, 0}, fn
  "down " <> y, {acc_x, acc_y, aim} -> {acc_x, acc_y, aim + String.to_integer(y)}
  "up " <> y, {acc_x, acc_y, aim} -> {acc_x, acc_y, aim - String.to_integer(y)}
  "forward " <> x, {acc_x, acc_y, aim} ->
    x = String.to_integer(x)
    {acc_x + x, acc_y + (aim * x), aim}
end)
|> Tuple.to_list()
|> Enum.take(2)
|> Enum.product()
|> IO.inspect()
