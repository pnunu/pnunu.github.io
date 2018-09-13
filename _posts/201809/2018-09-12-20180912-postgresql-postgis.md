---
title: 阿里云PG的RDS添加空间扩展
date: 16:04 2018/9/13
---

```
-- 查看postgres版本

SELECT version();

-- 创建postgis 空间扩展

create extension postgis

-- 查看postgis的版本

SELECT PostGIS_Full_Version();

-- 查看postgis安装了那些扩展

SELECT name, default_version,installed_version FROM pg_available_extensions WHERE name LIKE 'postgis%';

```