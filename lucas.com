server {
    listen 80;
    listen 443 ssl;
    root /var/www/lucas/html;
    index index.html index.htm index.nginx-debian.html;
    server_name lucas.com www.lucas.com;
    ssl_certificate /etc/ssl/certs/lucas.com.crt;
    ssl_certificate_key /etc/ssl/private/lucas.com.key;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        satisfy all;
        allow 192.168.57.0/24;
        allow 127.0.0.1;
        deny all;
        
        auth_basic "Área restringida";
        auth_basic_user_file /etc/nginx/.htpasswd;

        try_files $uri $uri/ =404;
    }

    # Bloqueo de acceso a /contact.html con autenticación básica
    location /contact.html {
        auth_basic "Área restringida";
        auth_basic_user_file /etc/nginx/.htpasswd;
    }
}