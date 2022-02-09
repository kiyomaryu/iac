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
$ gsutil mb gs://{バケット名}
```

### Procedure

```bash
# Terraformのバックエンドを開発環境用の定義に変更
$ terraform init -reconfigure -backend-config=backends/dev.tfvars

# Terraformの実行(確認がでたらyesで実行)
$ terraform apply -var-file=vars/dev.tfvars
```

## Note

- [参考サイト](https://tech.visasq.com/restart-gcp-infrastructure-as-code1/)