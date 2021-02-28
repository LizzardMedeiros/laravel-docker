FROM php:8.0.2
# Copia o composer e instala o laravel
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# Instala os pacotes e o laravel
RUN apt-get update && apt-get install -y \
    zip \
    unzip && \
    composer create-project laravel/laravel application
# Atualiza os arquivos
EXPOSE 8000
ENTRYPOINT ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]