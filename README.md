# example-infrastructure-monorepo

```tree
/{compute|data|access}-stack/{version}/
  interface.tf
  {resource-type}.tf
  terraform.tf
/environments/
  /dev/
    main.tf
    compute.tf
    data.tf
    access.tf
    terraform.tf
  /{uat|prod}-{compute|data|access}/
    main.tf
    {compute|data|access}.tf
    interface.tf
    providers.tf
    terraform.tf
```
