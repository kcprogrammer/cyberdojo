
def ellided_name(name, max_len)  
  if name.length > max_len
    name[0...max_len] + '...'
  else
    name
  end
end
