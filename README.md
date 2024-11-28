# aws-cli-docker

## Build the image

```shell
make build
```

## Create an alias

```shell
alias aws='docker run --rm -i -v ~/.aws:/home/developer/.aws -v "$(pwd):$(pwd)" -w "$(pwd)" -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN aws-cli'
```