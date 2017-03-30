def reverse(string)
  string.length == 0 ? "" : string[-1] + reverse(string[0...-1])
end
p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""
