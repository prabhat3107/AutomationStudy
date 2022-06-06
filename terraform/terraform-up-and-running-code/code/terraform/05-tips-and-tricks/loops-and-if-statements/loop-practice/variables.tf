variable "user_names" {

    description = "Create IAM users with these names"
    type = list(string)
    default = [ "priya1", "billi1", "meow1" ]
  
}