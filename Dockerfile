# Pythonのベースイメージを指定
FROM python:3.12

# Pythonのバッファリングを無効にする環境変数
ENV PYTHONUNBUFFERED 1

# 作業ディレクトリの作成と設定
RUN mkdir /Todo
WORKDIR /Todo

# 依存関係ファイルrequirements.txtをコピーしてインストール
ADD requirements.txt /Todo/
RUN pip install -r requirements.txt

# 現在のディレクトリの内容をコピー
ADD . /Todo/

# ポート8000を公開
EXPOSE 8000

# Django開発サーバーの起動コマンド
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]