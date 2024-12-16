# 概要
eks-argocdでデプロイされるアプリを管理するリポジトリ


# Features
 
- 自由な構成でアプリケーションを開発できる
- [別repo](https://github.com/yuu-misaki/eks-argocd-platform)と連携して、ECRにimageをpushするだけで迅速なデプロイができる

# Requirement
  
* VSCode
* docker
* AWSアカウントと権限を持ったIAMユーザー
 
# Installation

- ローカルの~/.awsにアクセスキーなどの認証情報を設定する。<br>
https://docs.aws.amazon.com/ja_jp/cli/v1/userguide/cli-configure-files.html
- 当リポジトリをcloneまたはforkし、VSCodeで起動する。
- devcontainerを起動する。（dockerが起動している必要がある）

## Usage
- 必要な変数を以下ファイルに設定していきます。
    - Makefile
    - kustomize/deployment.yaml

- 以下コードでアプリケーションイメージをECRにpushできます
```
make publish-image
```
