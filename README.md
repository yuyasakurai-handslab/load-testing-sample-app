# load-testing-sample-app
負荷分散テスト用のアプリ。負荷をかけられる方。

## NginxでBasic認証

以下をDockerfileに追記

[Dockerfile](Dockerfile)
```dockerfile
RUN apk add openssl \
&& echo "hogeuser:$(openssl passwd -crypt loadtesthoge)" >> /etc/nginx/.htpasswd
```

nginx.conf
[load-test.conf](nginx/conf/load-test.conf)(一部抜粋)
```nginx
    location / {
        auth_basic           "closed site";
        auth_basic_user_file /etc/nginx/.htpasswd;

        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }
```


## Copilot
ECSで簡単デプロイ

### 前提
- macOS
- aws cli 設定済み
### copilot install
```bash
brew install aws/tap/copilot-cli
```
### ccopilot init
```bash
copilot init 
```
1. Selected Service type: [Load Balanced Web Serivce]


### copilot delete 
```bash
copilot app delete --env-profiles test=default
```


## Reference
- Forked from [this repository](https://github.com/Daviey/nyan-cat)

    - Nyan Cat made with HTML5+CSS3 (and JavaScript :T).
