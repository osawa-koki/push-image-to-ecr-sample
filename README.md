# push-image-to-ecr-sample

🧅🧅🧅 ECRにDockerコンテナをプッシュしてみる！  

## コンテナのローカル実行

```shell
docker build -t my-image .
docker run --rm -d -p 80:80 --name my-container my-image
```
