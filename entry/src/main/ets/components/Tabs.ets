import { Home } from '../pages/Home';

interface B {
  title: string,
  targetIndex: number,
  selectedImg: Resource,
  normalImg: Resource,
  e?: () => void
}

@Preview
@Component
export default struct TabsView {
  @State currentIndex: number = 0;
  @State barHeight: number = 60
  @State activeColor: number | string = "#b2000000"
  @State primaryColor: number | string = "#C1C1C1"
  btnList: B[] = [
    {
      title: "首页",
      targetIndex: 0,
      selectedImg: $rawfile('tabs/home_a.png'),
      normalImg: $rawfile('tabs/home.png')
    },
    {
      title: "社区",
      targetIndex: 1,
      selectedImg: $rawfile('tabs/coum_a.png'),
      normalImg: $rawfile('tabs/coum.png')
    },
    {
      title: "我的",
      targetIndex: 2,
      selectedImg: $rawfile('tabs/mine_a.png'),
      normalImg: $rawfile('tabs/mine.png')
    }
  ]

  changePage(e: number) {
    this.currentIndex = e
  }

  // 获取当前设备断点形态
  @StorageProp("currentMediaType") currentMediaType: 'sm' | 'md' | 'lg' = 'sm'

  @Builder
  TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 20, height: 20 }).objectFit(ImageFit.Fill)
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? this.activeColor : this.primaryColor)
        .fontSize(10).margin({ top: 7, bottom: 3 })
    }
    .width("100%")
    .height("100%")
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Tabs({ barPosition: this.currentMediaType == 'sm' ? BarPosition.End : BarPosition.Start }) {
      TabContent() {
        Home()
      }
      .tabBar(this.TabBuilder(this.btnList[0].title, this.btnList[0].targetIndex, this.btnList[0].selectedImg,
        this.btnList[0].normalImg))

      TabContent() {
        Text("开发中...")
      }
      .tabBar(this.TabBuilder(this.btnList[1].title, this.btnList[1].targetIndex, this.btnList[1].selectedImg,
        this.btnList[1].normalImg))

      TabContent() {
        Text("开发中...")
      }
      .tabBar(this.TabBuilder(this.btnList[2].title, this.btnList[2].targetIndex, this.btnList[2].selectedImg,
        this.btnList[2].normalImg))
    }
    .vertical(this.currentMediaType == 'sm' ? false : true)
    .onChange((index: number) => {
      this.changePage(index)
    })
    .width('100%')
    .height("100%")
  }
}
