@Component
export struct MyList {
  dataList: number[] = [1, 2, 3, 4, 5]
  // 获取当前设备断点形态
  @StorageProp("currentMediaType") currentMediaType: 'sm' | 'md' | 'lg' = 'sm'

  build() {
    Column() {
      Text("列表栅格断点")
        .margin({ bottom: 10 })
        .fontSize(15)
        .width("100%")
      GridRow({
        columns: {
          xs: 1,
          sm: 1,
          md: 2,
          lg: 3
        },
        gutter: 15
      }) {
        ForEach(this.dataList, (item: number, idx: number) => {
          GridCol() {
            Row() {
              Text(`列表${item}`)
                .textAlign(TextAlign.Center)
                .width("100%")
            }
            .borderRadius(10)
            .width("100%")
            .height(130)
            .backgroundColor("#eee")
          }
        })
      }
      .onBreakpointChange((bp: string) => {
        // 此处回调打印 xs / sm / md ...
      })
    }
    .margin({ top: 30 })
  }
}