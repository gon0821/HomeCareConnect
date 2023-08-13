# HomeCareConnect
![ヘッダー画像](/docs/img/Readme/hcc_readme.png)


## ■ サービス URL

[HomeCareConnect（サービストップページ）](https://yonex0821naoki.net/)

## ■ サービス概要

在宅療養者にとって、命に関わる重要な健康管理を家族、医療・介護スタッフが連携して行い、在宅療養者を支える環境を構築します。

## ■ サービスを作った想い

現在、私の祖父が高齢になり在宅療養を続ける中で、家族、医療・介護スタッフをはじめとした周りのサポートが必要不可欠になっています。

しかし、患者に関する主な情報の共有方法としては電話や書面がメインであり、関係者が最新の情報を把握し続けることが難しく、迅速かつ適切な対応ができない場合があります。

また、在宅療養では複数の薬を常用していることがほとんどであり、中には飲み忘れにより病状が悪化し、時には命を失う危険性がある薬も含まれます。

こうした課題に対して、「私に何かできることはないか」と考えた結果、今回のサービスを作ることでより支援しやすい環境・体制を整え、祖父が安心して住み慣れた自宅で、最後まで暮らせるように周りが協力して見守っていきたいという想いがあります。

## ■ 課題に対しての実現方法

- 情報共有の難しさ
  - チャット機能を活用し、訪問看護師から医師、ケアマネジャー、そして家族まで、関係者全員が患者の健康状態をリアルタイムで共有します。これにより、情報の整合性を保ちつつ、迅速なサポートを可能にします。

- 確実なお薬の服用
  - 複数の服用しているお薬を登録することで、１日のスケジュールが時間順に表示されるお薬管理機能を実装することで、飲み忘れを防止し、正確な服用をサポートします。


## ■ 機能一覧

| トップ画面 |　新規登録画面 |
| ---- | ---- |
| ![トップ画面](/docs/img/Readme/top-page.png) | ![新規登録画面](/docs/img/Readme/sign-up-page.png) |
| トップ画面を実装しました。 | 認証機能を実装しました。 |

| ログイン画面 |　チャット画面 |
| ---- | ---- |
| ![ログイン画面](/docs/img/Readme/login-page.png) | ![チャット画面](/docs/img/Readme/chat-page.png) |
| ログイン機能を実装しました。 | チャット機能を実装しました。 |

| お薬追加画面 |　お薬リスト画面 |
| ---- | ---- |
| ![お薬追加画面](/docs/img/Readme/medication-new-page.png) | ![お薬リスト画面](/docs/img/Readme/medication-list-page.png) |
| お薬追加機能を実装しました。 | お薬リスト表示を実装しました。 |

| お薬編集画面 |　リスト展開画面 |
| ---- | ---- |
| ![お薬編集画面](/docs/img/Readme/medication-edit-page.png) | ![リスト展開画面](/docs/img/Readme/medication-list-toggle.png) |
| お薬編集機能を実装しました。 | お薬リストのメモを展開できるように実装しました。 |

| 服用スケジュール画面 |　ユーザーメニュー画面 |
| ---- | ---- |
| ![スケジュール画面](/docs/img/Readme/schedule-page.png) | ![ユーザーメニュー画面](/docs/img/Readme/user-menu-page.png) |
| 服用スケジュールを実装しました。 | ユーザーメニューを実装しました。 |

| ユーザー情報画面 |　ユーザー情報変更画面 |
| ---- | ---- |
| ![ユーザー情報画面](/docs/img/Readme/modal-window-page.png) | ![ユーザー情報変更画面](/docs/img/Readme/user-setting-page.png) |
| ユーザー情報を実装しました。 | ユーザー情報変更を実装しました。 |


## ■ 使用技術

| カテゴリー         | 使用技術                                     |
| ----------------- | --------------------------------------------------    |
| フロントエンド      | HTML/CSS,  JavaScript, jQuery, Bootstrap5              |
| バックエンド        | Ruby 3.2.2, Ruby on Rails 7.0.5                        |
| データベース    　  | MySQL 8.0.33                                           |
| 本番環境           | AWS（VPC, EC2, RDS, ALB, ACM, Route53）, Nginx, Unicorn |
| 開発環境           | Docker, Docker Compose, Git, GitHub                    |
| Rails             |  ActionCable, devise, dotenv-rails                     |
| 設計ツール          |  Miro, draw.io |

## ■ ER図

![ER図](/docs/img/ER_diagram/er_diagram1.4.png)

## ■ インフラ構成図

![インフラ構成図](/docs/img/system_configuration_diagram/system_configuration_diagram1.1.png)

<!-- ## ■ 作成時に工夫した点 -->


<!-- ## ■ 今後の課題 -->
