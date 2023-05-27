# Example M1 Terraform

## Transloadit
Bumping the version of transloadit supports the M1 Mac

## hashicorp/template v2.2.0
This version is now deprecated
https://registry.terraform.io/providers/hashicorp/template/latest/docs

This also isn't supported on M1 since it is outdated.

```
│ Provider registry.terraform.io/hashicorp/template v2.2.0 does not have a package available for your current platform,
│ darwin_arm64.
```

Replaced by: templatefile
https://developer.hashicorp.com/terraform/language/functions/templatefile

`templatefile` is supported on M1 this project is an example of converting a template from `template_file` to `templatefile`.

Using `template_file` example:
```
data "template_file" "gcf" {
  template = file(local.index_template_path)

  vars = {
    tf_state_database_name = var.client_info.firebase_state_database_name
    tf_node_env            = var.node_env
  }
}
```

Converted to templatefile
```
locals {
  user_data = templatefile("example.js", {
    tf_instance_id = "KO0954R8l"
    tf_node_env = "staging"
  })
}
```

This exmaple will produce a file `example-test.js` with the templated vars.
