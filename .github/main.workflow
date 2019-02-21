workflow "on push" {
  on = "push"
  resolves = ["echo"]
}

action "echo" {
  uses = "./.github/echo"
  args = "hi"
}