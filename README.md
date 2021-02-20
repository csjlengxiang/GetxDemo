# GetxDemo
此Demo为Getx上手使用demo，在使用getx之前，我深度使用了mobx作为状态管理。但是mobx需要生成代码。费时费力。
Getx的obx功能恰好可以替换，故而使用demo使用。
用下来发现Getx很啰嗦，代码侵入性太强了。
全局单例管理GetxController，对于GetxController的内存管理严重依赖Get.put(Controller()). Get.to(other()).
并且我感觉平级 Get.find() 功能就是伪需求.
所以经过demo测试，使用 Navigator.push(context, MaterialPageRoute(builder: (context) => Other()),); 果然就凉了
好在可以不Get.put放进去。采用inheriteWidget来传递GetxController，obx是依然生效的。故而只取这部分
