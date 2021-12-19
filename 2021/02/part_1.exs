"input.txt"
|> File.read!()
|> String.split("\n", trim: true)
|> Enum.reduce({0, 0}, fn
  "forward " <> x, {acc_x, acc_y} -> {acc_x + String.to_integer(x), acc_y}
  "down " <> x, {acc_x, acc_y} -> {acc_x, acc_y + String.to_integer(x)}
  "up " <> x, {acc_x, acc_y} -> {acc_x, acc_y - String.to_integer(x)}
end)
|> Tuple.to_list()
|> Enum.product()
|> IO.inspect()
