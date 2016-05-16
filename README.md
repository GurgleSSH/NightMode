# NightMode
###iOS下的夜间模式工具类
-----

## WHAT 是什么

> iOS下的夜间模式工具类，通过通知中心实现。

### 方法

#### ` + sharedNightMode `

初始化方法（单例）。

* #### 声明

	```
	+ (instancetype)sharedNightMode
	```
	
* #### 返回值

	返回LSNightMode的实例对象。
	
----

#### ` - nightModeWithObserver: `

获取当前夜间模式状态的一步调用方法。

> 一般地，在设置夜间模式页面的ViewController调用该方法，该ViewController应该是观察者。添加观察者之后要在dealloc方法中调用 ` [[NSNotificationCenter defaultCenter] removeObserver:] `方法对观察者进行移除！

* #### 声明

	```
	- (void)nightModeWithObserver:(id)observer
	```

* #### 参数列表

	| 参数名 | 描述 |
	| ------------ | ------------- |
	| observer | 观察者 |
	
----

#### ` - changeNightMode `

改变当前的夜间模式状态，在夜间和日间模式之间切换。

> 从本地配置文件中获取当前夜间模式的设置状态，之后改变其状态，发出通知，将改变后的配置写回本地。

* #### 声明

	```
	- (BOOL)changeNightMode
	```

* #### 返回值

	返回改变后的夜间模式状态（是否是夜间模式）。
	
----
	
#### ` - getNightModeState `
（从本地配置文件中）获取当前夜间模式的设置状态。

* #### 声明

	```
	- (BOOL)getNightModeState
	
	```
	
* #### 返回值
	返回当前夜间模式状态（是否是夜间模式）。

----	

### 协议

#### 协议方法

##### ` - setToDayMode ` *Required*

当发出日间模式通知时调用该方法

* ##### 声明
	
	```
	- (void)setToDayMode
	```
----

##### ` - setToNightMode ` *Required*

当发出夜间模式通知时调用该方法

* ##### 声明
	
	```
	- (void)setToNightMode
	```

## HOW 如何使用

1. 将 **LSNightMode** 文件夹下的文件 **LSNightMode.h** 和 **LSNightMode.m** 拖入自己的工程。 
2. 创建UIViewController的基类UIViewControllerBase。
3. 在基类中引入头文件 `#import "LSNightMode.h"` 。
4. 在基类.m文件中签署 `<LSNightMode>` 协议。
5. 在`viewDidLoad`中调用方法

	```
	[[LSNightMode sharedNightMode] nightModeWithObserver:self]; //一步方法，将当前VC设为观察者，从配置文件中获取当前夜间模式状态并设置成对应模式
	
	```
6. 实现协议方法 `- setToDayMode`和`- setToNightMode`。
7. 在dealloc方法中移除当前观察者

	```
	- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
	```
8. 在基类的.h文件中声明两个协议方法，供子类对协议方法进行重写，以实现子类特有的夜间模式配色。

	```
	/** 子类可重写以下两个方法，以实现子类特有的夜间模式配色. */
	//change to night mode
	- (void)setToNightMode;

	//change to day mode
	- (void)setToDayMode;
	
	```
9. 创建继承与基类的子类ViewController，.m文件代码如下：
	
	```
	//
	//  ViewController.m
	//  NightMode
	//
	//  Created by liushuai on 16/5/10.
	//  Copyright © 2016年 liushuai1992@gmail.com. All rights reserved.
	//

	#import "ViewController.h"
	#import "LSNightMode.h"

	@interface ViewController ()

	@property (nonatomic, strong) UISwitch *swithButton;

	@end

	@implementation ViewController

	- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.swithButton];
    //为swith按钮添加点击事件
    [self.swithButton addTarget:self action:@selector(swithButtonHandle:) forControlEvents:UIControlEventValueChanged];
	}

	- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	}

	- (UISwitch *)swithButton {
    if (!_swithButton) {
        _swithButton = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    }
    //根据当前夜间模式状态将swith按钮设置成为对于状态
    [_swithButton setOn:[[LSNightMode sharedNightMode] getNightModeState]];
    return _swithButton;
	}

	//点击swith按钮时调用
	- (void)swithButtonHandle:(UISwitch *)switchButton {
    //改变当前夜间模式状态
    [[LSNightMode sharedNightMode] changeNightMode];
	}

	@end

	```
	