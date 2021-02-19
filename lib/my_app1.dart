import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}

class MyHomePage1 extends StatelessWidget {

  @override
  Widget build(context) {

    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final Controller c = Get.put(Controller());

    return Scaffold(
      // 使用Obx(()=>每当改变计数时，就更新Text()。
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // 用一个简单的Get.to()即可代替Navigator.push那8行，无需上下文！
        body: Center(child: RaisedButton(
            child: Text("Go to Other"), onPressed: () {
            Get.to(Other());
            // 注意此处注释
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Other()),);
          })),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Controller1 extends GetxController{
  var count = 0.obs;
  increment() => count++;
}

class Other extends StatelessWidget {
  @override
  Widget build(context){

    return GetBuilder<Controller1>(
      init: Controller1(), // 首次启动
      builder: (c1) => Scaffold(body: Center(child: Text("${c1.count}")),
          floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c1.increment)
      ),
    );

    final Controller1 c1 = Get.put(Controller1());
    // 访问更新后的计数变量
    return Scaffold(body: Center(child: Obx(() => Text("${c1.count}"))),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c1.increment)
    );
  }
}

class Other1 extends StatelessWidget {
  @override
  Widget build(context){
    final Controller1 c1 = Controller1();
    // 访问更新后的计数变量
    return Scaffold(body: Center(child: Obx(() => Text("${c1.count}"))),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c1.increment)
    );
  }
}