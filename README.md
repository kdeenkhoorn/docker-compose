# My Datacenter docker compose file
This docker-compose file starts my personal docker datacenter on my Odroid HC2 with the following layout:

```
                                           80/443
     LAN  +-----------------------------------+-----------------------------------------+
                                              |
                                              |
                                              |
                                      +-------+------+
                                      |  trafik.int  |
                                      +-------^------+
                                              |
                                              |
              80             8765           80|         8080       3000        80
Proxy.int +----+--------------+--------------+-----------+----------+----------+--------+
               |              |              |           |          |          |
               |              |              |           |          |          |
           +---+---+    +-----+-----+   +----+-----+  +--+---+  +---+--+  +-----------+
           |  www  |    | motioneye |   |phpmyadmin|  | elog |  | gogs |  | ontwikkel |
           +---+---+    +-----+-----+   +----+-----+  +------+  +---+--+  +-----------+
               |                             |                      |          |
               |                             |                      |          |
               |                        3306 |                      |          |
  Backend +----v-------------------------^---v----------------------v----------v--------+
                                         |
                                    +----+-----+
                                    |  mysqld  |
                                    +----------+
```

Traefik in this setup generates SSL certificates for my hostnames like:
* Containername : elog 
* Sitename      : https://elog.int.kdedesign.nl

This is done by manipulating my DirectAdmin DNS with the plugin for traefik i have developed: https://github.com/kdeenkhoorn/update_dns_traefik.git
One file not included in this git repo is the file '.env' in the root of this project containing the variable 'EMAIL' which holds my email address for LetsEncrypt purposes.

Greetzzz and have fun,

Kl@@s
