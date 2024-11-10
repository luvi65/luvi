import { MyList } from '../components/MyList';
import { MySwiper } from '../components/MySwiper';

@Component
export struct Home {
  @State message: string = 'Hello World';

  build() {
    Scroll() {
      Column() {
        // 轮播图
        MySwiper()

        // 列表
        MyList()
      }
      .alignItems(HorizontalAlign.Start)
      .width("100%")
      .padding({ left: 15, right: 10 })
    }
    .height("100%")
    .width("100%")
  }
}