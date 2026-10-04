FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# TDLib محتاجة مكتبات كتير، والعن Peters بتاع Redis كمان
RUN apt-get update && apt-get install -y --no-install-recommends \
        lua5.3 \
        liblua5.3-dev \
        redis-server \
        luarocks \
        unzip \
        zip \
        curl \
        ca-certificates \
        git \
        build-essential \
        python3 \
        python3-pip \
        ffmpeg \
    && rm -rf /var/lib/apt/lists/*

RUN luarocks install luasocket \
    && luarocks install luasec \
    && luarocks install luautf8 \
    && luarocks install redis-lua

# ملفات البوت
WORKDIR /app
COPY . /app/

# فكّ TDLib مرة واحدة وقت البناء
RUN unzip -o tdlua.zip \
    && chmod +x Run \
    && mkdir -p /app/data

# التوكن ومفاتيح الـ API بتيجي من متغيرات البيئة — مش من داخل الكود
# TOKEN إجبارية، البتوع التانية اختيارية
ENV TOKEN="" \
    SUDO_ID="" \
    USER_SUDO="" \
    OPENAI_KEY="" \
    BOT_DATA_DIR="/app/data"

# فولدر تخزين TDLib — لازم يفضل محفوظ بين الريستارتات
VOLUME ["/app/data"]

CMD ["./Run"]
