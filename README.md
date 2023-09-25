# nacos-oracle-2.2.3
# nacos2.2.3改造成oracle11g版本 windows单机版本 Releases下载开箱即用
1、导入sql文件
#
2、修改数据库配置文件路径：nacos\conf\application.properties
#
修改此处连接IP地址、oracle账号和密码
db.url.0=jdbc:oracle:thin:@127.0.0.1:1521:orcl
db.user=user
db.password=User.123456
#
3、进入nacos\bin\目录，启动服务 startup.cmd -m standalone （linux对应修改即可）



