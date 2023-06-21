# stellar_town

- 恒星镇
- 为星空摄影爱好者提供相关信息
- 提供星空摄影作品展示平台
- 进行社区交流与学习

## 开发环境

- Flutter 3.10.3
- Dart 3.0.3
- Android api-31

## 项目结构

- lib
  - view => 页面，命名格式为‘XxxView’
  - component => 自定义组件
  - entity => 实体类
  - util => 工具类，命名格式为‘XxxUtil’
  - constant => 常量
  - theme => 主题，命名格式为‘XxxTheme’
  - main.dart => app入口文件
- 一般情况下二级目录下按照功能大类继续划分包

## 项目规范

- 项目中类名使用大驼峰命名法，变量名、函数名等使用小驼峰命名法
- 文件开头注释包含文件描述、作者、创建时间信息
- 函数注释包含函数描述、（异步）、参数、返回值信息
- 实体类注释包含属性描述

## 项目依赖

- [dio ^4.0.0](https://pub.flutter-io.cn/packages/dio) => 网络请求
- [shared_preferences ^2.1.2](https://pub.flutter-io.cn/packages/shared_preferences) => 本地存储
- [dart_mappable ^3.1.1](https://pub.flutter-io.cn/packages/dart_mappable) => json/实体类转换
- [dart_mappable_builder ^3.1.1](https://pub.flutter-io.cn/packages/dart_mappable_builder) => mappable代码生成
- [build_runner ^2.4.5](https://pub.flutter-io.cn/packages/build_runner) => 自动代码生成

## Flutter相关
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
