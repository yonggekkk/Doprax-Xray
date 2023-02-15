#### Doprax一键五协议共存

#### Xray内核，支持vless，vmess，trojan，shadowsocks，socks五个配置同时在线！支持自定义伪装网站

#### [相关文字视频教程请点击](https://ygkkk.blogspot.com/2023/01/doprax-xray-v2ray-cdn.html)

------------------------

#### 以下变量都为非必选变量，按需求添加
| 变量含义 | 变量名称| 变量规范值| 不添加该变量名称时，最终默认结果|
| :--- | :--- | :--- | :--- |
| 各协议uuid或密码 | uuid |可在V2raN上随机生成，或者自定义uuid格式|ea4909ef-7ca6-4b46-bf2e-6c07896ef338|
| 伪装网页 | www |数字1-9任选一个数字，共9个伪装网页可选择|显示Nginx欢迎界面|
| Xray版本 | ver |[版本号查看](https://github.com/XTLS/Xray-core/tags)，格式为x.x.x ，比如1.7.1|自动更新到Xray最新正式版|
|更新中……|更新中……|更新中……|更新中……|
---------------
#### 目前Cloudflare Argo隧道域名自动生成，重启平台后会强制重置隧道域名，须再次进入open shell，输入cat log查看

---------------
#### 五个协议的客户端参数小白文如下：

服务器地址：doprax分配的域名 ，CDN时填自定义、workers、argo域名或者自选IP

端口：443

（http端口：可选80、8080、8880、2052、2082、2086、2095，tls必须关闭）

（https端口：可选443、2053、2083、2087、2096、8443，tls必须开启）

用户名、密码、uuid：自定义uuid

加密方式/算法：ss为chacha20-ietf-poly1305，其他协议默认不变即可

插件(仅ss，socks才有)：v2ray-plugin，建议关闭多路复用

传输协议/方式：ws或者websocket

伪装域名host/sni：doprax分配的域名或者留空，CDN时填自定义、workers、argo域名

vless的path路径：/自定义uuid-vl

vmess的path路径：/自定义uuid-vm

trojan的path路径：/自定义uuid-tr

shadowsocks的path路径：/自定义uuid-ss

socks的path路径：/自定义uuid-so

传输安全TLS：开启


---------------------------------------------------------------------------------------

#### 鸣谢表：
静态伪装站取自[mack-a](https://github.com/mack-a/v2ray-agent)，参考项目[hiifeng](https://github.com/hiifeng/V2ray-for-Doprax)、[fscarmen](https://github.com/fscarmen2/V2-for-Doprax)


