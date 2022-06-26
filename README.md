# rails blog post


### 功能实现：
- restful api server
- 提供了article简单的增删改查
- 提供了tag简单的增删改查
- article和tag是多对多的关系
- 提供了粗粒度的api test（rspec）

### 未做的
- 接口参数校验
- 接口错误抛出逻辑
- api test粒度太粗
- api doc未做

### 部署
1. 安装依赖
```
bundle install
```
2. 配置数据库，database.yml
3. 数据库初始化
```
rake db:create
rails db:migrate
```
4. 接口测试
```
rspec 
```
5. 启动服务
```
rails s
```



