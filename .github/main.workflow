workflow "on pr" {
  on = "pull_request"
  resolves = ["echo", "echo my secrets"]
}

action "echo" {
  uses = "./.github/echo"
  args = "hi"
}

action "echo my secrets" {
  uses = "./.github/echo-secrets"
  secrets = ["HERES_A_SECRET"]
  args = "hi"
}