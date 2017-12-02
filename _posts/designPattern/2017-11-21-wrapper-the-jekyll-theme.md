---
title: 设计模式（一）-装饰者模式[Decorator] 
date: 2017-11-20 22:06:52
---

Decorator模式（别名Wrapper）：动态将职责附加到对象上，若要扩展功能，装饰者提供了比继承更具弹性的代替方案。

---

> 设计原则：
1. 多用组合，少用继承。
利用继承设计子类的行为，是在编译时静态决定的，而且所有的子类都会继承到相同的行为。然而，如果能够利用组合的做法扩展对象的行为，就可以在运行时动态地进行扩展。
2. 类应设计的对扩展开放，对修改关闭。

---

以星巴克咖啡为例子
代码实现：

#### 1、接口
```
public abstract class Beverage {
    String description = "Unkown Beverage";
    public String getDescription() {
        return description;
    }
    public abstract double cost();
}

public abstract class CondimentDecorator extends Beverage {
    public abstract String getDescription();
}
```
#### 2、实现类
```
/** DackRoast */
public class DackRoast extends Beverage {
    public DackRoast() {
        description = "DackRoast";
    }

    @Override
    public double cost() {
        return 1.5;
    }
}
/** 猫屎咖啡 */
public class Decat extends Beverage {
    public Decat() {
        description = "Decat coffee";
    }

    @Override
    public double cost() {
        return 0.01;
    }
}
/** 摩卡 */
public class Mocha extends CondimentDecorator {
    Beverage beverage;

    public Mocha(Beverage beverage) {
        this.beverage = beverage;
    }

    @Override
    public String getDescription() {
        return beverage.getDescription() + ", Mocha";
    }

    @Override
    public double cost() {
        return 0.20 + beverage.cost();
    }
}
```
#### 3、测试
```
public class StarbuzzCoffee {
    public static void main(String[] args) {
        Beverage beverage = new Espresso();
        System.out.println(beverage.getDescription() + " $" + beverage.cost());

        Beverage beverage1 = new DackRoast();
        beverage1 = new Mocha(beverage1);
        beverage1 = new Mocha(beverage1);
        beverage1 = new Whip(beverage1);
        System.out.println(beverage1.getDescription() + " $" + beverage1.cost());

        Beverage beverage2 = new HouseBlend();
        beverage2 = new Soy(beverage2);
        beverage2 = new Mocha(beverage2);
        beverage2 = new Whip(beverage2);
        System.out.println(beverage2.getDescription() + " $" + beverage2.cost());
    }
}
```
#### 4、结果
![Wrapper](/images/201711/20171121-Wrapper.png)

### 小发现
```
System.out.println(1.5 + 0.2 + 0.2 + 0.3);
double d1 = 1.5 + 0.2 + 0.2 + 0.3;
double d2 = 2.2;
if ((1.5 + 0.2 + 0.2 + 0.3) == 2.2)
    System.out.println("yes");
else
    System.out.println("no");

if ((1.5 + 0.2 + 0.2 + 0.3) == d1)
    System.out.println("yes");
else
    System.out.println("no");

if (d2 == d1)
    System.out.println("yes");
else
    System.out.println("no");
```
猜猜这段代码的输出结果？
答案是：
```
2.1999999999999997
no
yes
no
```

出现此现象的原因是java的精度，当然任何的编程语言都存在精度问题。
计算机中存储小数的时候，把小数存转化为二进制后，精度一定会丢失。
下面我们具体计算一下0.6的小数表示过程：
```
0.6 * 2 = 1.2 —————— 1 
0.2 * 2 = 0.4 —————— 0 
0.4 * 2 = 0.8 —————— 0 
0.8 * 2 = 1.6 —————— 1 
0.6 * 2 = 1.2 —————— 1 
0.2 * 2 = 0.4 —————— 0
0.4 * 2 = 0.8 —————— 0
…………
：0.1001100
```
Java 数据类型无论是double、还是float都值是一定的长度。所以像0.6的这类数据一定会丢失精度
任何编程语言不能避免此类问题。
