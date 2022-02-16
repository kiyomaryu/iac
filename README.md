## About

Terraform及びAnsibleの定義を記載しています。
GCPにてインスタンスの立ち上げ→インスタンスのプロビジョニングまでを自動化しています。

## Usage

### Pre-work

Terraformの実行状態を保持するtfstateファイルを実行する環境で共通化するためにGCS上のバケットに格納します。事前作業としてバケットを作成します。

```bash
# Googleの認証設定(切れている場合)
$ gcloud auth application-default login 

# バケットの作成
# バケット名はURIになるためユニークなものでは無いとだめ。既に他のユーザが使っているものがある場合は403エラーで作成できない
$ gsutil mb -c Standard -l us-east1 gs://{バケット名}
```

### Procedure

#### terraform
```bash
# Terraformのバックエンドを開発環境用の定義に変更
$ terraform init -reconfigure -backend-config=backends/dev.tfvars

# Terraformの実行(確認がでたらyesで実行)
$ terraform apply -var-file=vars/dev.tfvars
```

#### ansible

```bash
# sa_123456789はダミーであるためプロビジョニング用にGCPで作成したアカウントで行うこと
$ ansible-playbook --inventory=inventories/dev.gcp.yml --private-key secrets/ssh-key-ansible-sa --user sa_123456789 site.yml --diff --check
```

#### packer

```bash
# packerの実行
$ packer build -var "stage=dev" -var "gcp_project=GCPのプロジェクトID" packer.template.json
```
## Note

- [参考サイト](https://tech.visasq.com/restart-gcp-infrastructure-as-code1/)
- [試行錯誤の調査ログ](https://twitter.com/kiyomaryu/status/1490858345791516674?s=20&t=IDtbVvAfb4qp2XEpJpgIQg)
