##ZXYNetworkState使用方法
 1.导入CoreTelephony.framework框架

 2.导入#import "ZXYNetworkState"头文件

 3.获取当前网络状态：ZXYNetworkStatus status=[ZXYNetworkState zxy_state];

 4.作出判断

 	a. 若status==ZXYNetWorkState2G，则当前网络状态为2G；

 	b. 若status==ZXYNetWorkStateEdge，则当前网络状态为2.75G(Edge)；

 	c. 若status==ZXYNetWorkState3G，则当前网络状态为3G；

 	d. 若status==ZXYNetWorkState4G，则当前网络状态为4G；

 	e. 若status==ZXYNetWorkStateWifi，则当前网络状态为wifi；

 	f. 若status==ZXYNetWorkStateNotReachable，则当前网络状态为不可用；






