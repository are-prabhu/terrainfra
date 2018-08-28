# Terrainfra

## Quick start

1. To setup development environment of terraform setup the aws secret keys and follow the steps.
     *  create `~/.aws/config` and `~/.aws/credentials` or 
     *  export `AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY`  / `AWS_DEFAULT_REGION` in environment

2. [Install Terraform](https://www.terraform.io/intro/getting-started/install.html) or you can run this command `brew install terraform`   in Mac.

3. Install Terragrunt by going to the [Releases Page](https://github.com/gruntwork-io/terragrunt/releases),
   downloading the binary for your OS, renaming it to `terragrunt`, and adding it to your PATH.

4. Clone the repo, navigate to terrainfra to get start with `terragrunt init`.
   Following are few the usefull commands 

   ```bash
    terragrunt init
    terragrunt get
    terragrunt plan
    terragrunt apply
    terragrunt output
    ```

5. Terragrunt is a wrapper on top of Terraform, we use Terragrunt to reduce the complexity of s3 backend 
   s3 backend is to acquire the state lock and avoid the conflict between simaltanious `terraform apply` for the same resources. 


Pull Request welcome!!! 

