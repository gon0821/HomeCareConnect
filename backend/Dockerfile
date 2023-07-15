# ベースとなるDockerイメージ指定
FROM --platform=linux/x86_64 ruby:3.2

# 作業ディレクトリの作成、設定
RUN mkdir /app
WORKDIR /app

# ローカルのGemfileをコンテナ内の/app/にコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Gemfileに記載されているgem(Rails)をインストール
RUN bundle install

# ソースコードをコンテナへコピー
COPY . /app

# Rails特有の問題を回避するために、コンテナ実行時にPIDファイルを削除
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# 3000番ポートを設定
EXPOSE 3000

# Railsサーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
