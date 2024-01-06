# ベースとなるイメージを指定
FROM archlinux:latest

# パッケージデータベースの更新と必要なパッケージのインストール
RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm vim tmux less tzdata

# ロケールとタイムゾーンの設定
RUN echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen \
    && echo "Asia/Tokyo" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# 環境変数の設定
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

# 作業ディレクトリの設定
WORKDIR /grafanadockervolume