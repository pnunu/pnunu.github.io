---
title: Java中InputStream和String之间的转换方法
date: 17:07 2018/8/10
---

源码地址：  https://github.com/pnunu/pnunu-io

# Java中InputStream和String之间的转换方法

在Java中InputStream和String之间的转化十分普遍，本文主要是总结一下转换的各种方法，包括JDK原生提供的，还有一些外部依赖提供的。

## 1、InputStream转化为String

### 1 JDK原生提供

```
方法一：
byte[] bytes = new byte[inputStream.available()];
inputStream.read(bytes);
String str = new String(bytes);

方法二：
String result = new BufferedReader(new InputStreamReader(inputStream))
        .lines().collect(Collectors.joining(System.lineSeparator()));

方法三：
String result = new BufferedReader(new InputStreamReader(inputStream))
       .lines().parallel().collect(Collectors.joining(System.lineSeparator()));


方法四：
Scanner s = new Scanner(inputStream).useDelimiter("\\A");
String str = s.hasNext() ? s.next() : "";

方法五：
String resource = new Scanner(inputStream).useDelimiter("\\Z").next();
return resource;


方法六：
StringBuilder sb = new StringBuilder();
String line;

BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
while ((line = br.readLine()) != null) {
    sb.append(line);
}
String str = sb.toString();
return str;


方法七：
ByteArrayOutputStream result = new ByteArrayOutputStream();
byte[] buffer = new byte[1024];
int length;
while ((length = inputStream.read(buffer)) != -1) {
    result.write(buffer, 0, length);
}
String str = result.toString(StandardCharsets.UTF_8.name());
return str;


方法八：
BufferedInputStream bis = new BufferedInputStream(inputStream);
ByteArrayOutputStream buf = new ByteArrayOutputStream();
int result = bis.read();
while(result != -1) {
    buf.write((byte) result);
    result = bis.read();
}
String str = buf.toString();
return str;

```

### 2 Apache Common提供
```
方法九：
StringWriter writer = new StringWriter();
IOUtils.copy(inputStream, writer, StandardCharsets.UTF_8.name());
String str = writer.toString();

方法十：
String str = IOUtils.toString(inputStream, "utf-8");

```



### 3 Google Guava提供
```
方法十一：
String str = CharStreams.toString(new InputStreamReader(inputStream, StandardCharsets.UTF_8));

方法十二：
String str = new String(ByteStreams.toByteArray(inputStream));


```


## 2、String转化为InputStream

### 1 JDK原生提供

```
InputStream is = new ByteArrayInputStream(str.getBytes());
```

### 2 Apache Common提供

```
InputStream targetStream = IOUtils.toInputStream(str, StandardCharsets.UTF_8.name());
```

### 3 Google Guava提供

```
InputStream targetStream =
        new ReaderInputStream(CharSource.wrap(str).openStream(), StandardCharsets.UTF_8.name());
```


## 执行结果

```
InputStream2String.readInputStream01
readInputStream01, ms:215
InputStream2String.readInputStream02
readInputStream02, ms:426
InputStream2String.readInputStream03
readInputStream03, ms:1180
InputStream2String.readInputStream04
readInputStream04, ms:495
InputStream2String.readInputStream05
readInputStream05, ms:687
InputStream2String.readInputStream06
readInputStream06, ms:205
InputStream2String.readInputStream07
readInputStream07, ms:126
InputStream2String.readInputStream08
readInputStream08, ms:1432
InputStream2String.readInputStream09
readInputStream09, ms:96
InputStream2String.readInputStream10
readInputStream10, ms:124
InputStream2String.readInputStream11
readInputStream11, ms:110
InputStream2String.readInputStream12
readInputStream12, ms:135
```
