@Component
export struct MySwiper {
  swiperList: number[] = [1, 2, 3, 4, 5]
  // 获取当前设备断点形态
  @StorageProp("currentMediaType") currentMediaType: 'sm' | 'md' | 'lg' = 'sm'

  build() {
    Column() {
      Swiper() {
        ForEach(this.swiperList, (item: number, idx: number) => {
          Row() {
            Text(`图片${item}`)
              .textAlign(TextAlign.Center)
              .width("100%")
          }
          .borderRadius(10)
          .width("100%")
          .height(200)
          .backgroundColor(idx % 2 == 0 ? "#ddd" : "#ffb0b0b0")
        })
      }
      .itemSpace(10)
      // 根据断点设置分割个数
      // sm 小屏形态只展示 1 个，其他形态展示 2 个
      .displayCount(this.currentMediaType == "sm" ? 1 : 2)
      .autoPlay(true)
      .borderRadius(10)
      .clip(true)
    }
  }
}