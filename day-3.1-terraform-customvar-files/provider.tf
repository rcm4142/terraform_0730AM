# calling keys from my local machine dev profile credentials 
## dev environment provider block##
provider "aws" {
  alias  = "dev"
  region = "us-east-1"
}
provider "aws" {
  alias  = "testenv"
  region = "us-east-1"
}