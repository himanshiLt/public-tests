workflow "Test (Push)" {
  on = "push"
  resolves = ["npm test"]
}

workflow "Test (Pull Request)" {
  on = "pull_request"
  resolves = ["npm test"]
}


action "checkout pull request" {
  uses = "gr2m/git-checkout-pull-request-action@master"
}

action "npm ci" {
  needs = ["checkout pull request"]
  uses = "docker://node:alpine"
  runs = "npm"
  args = "ci"
}

action "npm test" {
  needs = "npm ci"
  uses = "docker://node:alpine"
  runs = "npm"
  args = "test"
}