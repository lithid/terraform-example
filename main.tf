terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
    # v 0.5.1 resolved M1 Mac Issues
    transloadit = {
      version = "0.7.0"
      source  = "transloadit/transloadit"
    }
  }
}

# Converted to templatefile
locals {
  user_data = templatefile("example.js", {
    tf_instance_id = "KO0954R8l"
    tf_node_env = "staging"
  })
}

resource "local_file" "example_js" {
  filename = "example-test.js"
  content = local.user_data
}
