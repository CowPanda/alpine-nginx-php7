# alpine-nginx-php7 default
test and add more php extension dependencies.

> volume : -v /path:/usr/share/nginx/html

#alpine-nginx-php7 mongodb

test php7 use mongodb driver of laravel5. pull image:`docker pull
cowpanda/alpine-nginx-php7:mongodb`.
* `note` the tag of `cowpanda/alpine-nginx-php7:mongodb` default `volume` is
    `/var/www/html` ;
    
# example

```
    docker run -d --name container_name -v your_php_source_path:/usr/share/nginx/html cowpanda/alpine-nginx-php7:latest
```
