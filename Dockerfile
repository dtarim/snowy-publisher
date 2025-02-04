# Base image olarak Ubuntu kullanıyoruz
FROM ubuntu:latest

# Gerekli bağımlılıkları yükleyelim
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Çalışma dizinini ayarlayın
WORKDIR /app

# Gerekli dosyaları kopyalayın
COPY cities.json /app/cities.json
COPY get_weather.sh /app/get_weather.sh
COPY publish.sh /app/publish.sh

# Scriptlerin çalıştırılabilir olmasını sağlıyoruz
RUN chmod +x /app/*.sh

# ENTRYPOINT ile publish.sh script'ini çalıştırın ve ek argümanları kabul edin
ENTRYPOINT ["bash", "/app/publish.sh"]
