setup:
	@make build
	@make up 
	@make composer-update
ps: 
	docker-compose ps
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
cache:
    docker exec laravel-docker bash -c "php artisan config:cache"
    docker exec laravel-docker bash -c "php artisan config:clear"
    docker exec laravel-docker bash -c "php artisan cache:clear"
    
composer-update:
	docker exec laravel-docker bash -c "composer update"
data:
	docker exec laravel-docker bash -c "php artisan migrate"
	docker exec laravel-docker bash -c "php artisan db:seed"

