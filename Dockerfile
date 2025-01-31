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

# Şehirler dosyasını, script dosyalarını ve diğer gerekli dosyaları kopyalayın
COPY cities.txt /app/cities.txt
COPY get_weather.sh /app/get_weather.sh
COPY publish.sh /app/publish.sh
COPY run.sh /app/run.sh

# Scriptlerin çalıştırılabilir olmasını sağlıyoruz
RUN chmod +x /app/*.sh

# Çalıştırılacak komutu belirtiyoruz
CMD ["bash", "./publish.sh"]
