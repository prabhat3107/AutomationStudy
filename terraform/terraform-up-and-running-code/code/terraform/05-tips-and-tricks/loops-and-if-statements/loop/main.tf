variable "names" {

    description = "A list of names"
    type = list(string)
    default = [ "neo", "trinity", "morpheus" ]
  
}

variable "hero" {

    description = "map"

    type = map(string)

    default = {
      "priya" = "billi"
      "meow" = "Lovely Billi"
      "billi" = "lovely meow"
    }
  
}


output "for_directive" {

    value = "%{ for name in var.names}${name}, %{endfor}"
  
}

output "for_directive_index" {

    value = "%{ for i, name in var.names}(${i}) ${name}, %{endfor}"
  
}

output "billis" {

    value = [ for name, role in var.hero :  "${name} is the ${role}"]
  
}

output "billis_map" {

    value = { for name, role in var.hero : upper(role) => upper(name)}
  
}


output "short_upper_names" {

    value = [for name in var.names : upper(name) if length(name) > 5]
  
}

output "upper_names" {

    value =  [ for name in var.names: upper(name)]
  
}