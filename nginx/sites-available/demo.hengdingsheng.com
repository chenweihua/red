upstream demo {
    server localhost:3001       weight=5;
}

server {
	listen 80;
  server_name demo.hengdingsheng.com;

  location / {
        proxy_pass http://demo;
  }


    listen 443 ssl; # managed by Certbot
ssl_certificate /etc/letsencrypt/live/registry.hengdingsheng.com/fullchain.pem; # managed by Certbot
ssl_certificate_key /etc/letsencrypt/live/registry.hengdingsheng.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot



    if ($scheme != "https") {
        return 301 https://$host$request_uri;
    } # managed by Certbot

}

