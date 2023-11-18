# push-image-to-ecr-sample

🧅🧅🧅 ECRにDockerコンテナをプッシュしてみる！  

## コンテナのローカル実行

```shell
docker build -t my-image .
docker run --rm -d -p 80:80 --name my-container my-image
```

## 手動デプロイ
  
```shell
# スタック名の指定
export stack_name=<stack-name>

# AWSリソースのプロビジョニング
aws cloudformation deploy --template-file ./template.yml --stack-name $stack_name

# ECRへのログイン
aws cloudformation describe-stacks --stack-name $stack_name --query "Stacks[0].Outputs[?OutputKey=='LoginCommand'].OutputValue" --output text --no-cli-pager | bash

# コンテナイメージのビルド
aws cloudformation describe-stacks --stack-name $stack_name --query "Stacks[0].Outputs[?OutputKey=='BuildCommand'].OutputValue" --output text --no-cli-pager | bash

# イメージへのタグ付け
aws cloudformation describe-stacks --stack-name $stack_name --query "Stacks[0].Outputs[?OutputKey=='TagCommand'].OutputValue" --output text --no-cli-pager | bash

# ECRへのプッシュ
aws cloudformation describe-stacks --stack-name $stack_name --query "Stacks[0].Outputs[?OutputKey=='PushCommand'].OutputValue" --output text --no-cli-pager | bash
```

## 継続的デリバリー

`v-*`という形式のタグがついたコミットをプッシュすると、GitHub Actionsが実行され、ECRにコンテナイメージがプッシュされます。  
