FROM python:3.10.12-slim-bullseye

# apt更换镜像源，并更新软件包列表信息
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update

RUN python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
    click

COPY ./src/ /app
COPY ./service/flag /flag
WORKDIR /app

CMD ["python3","main.py"]