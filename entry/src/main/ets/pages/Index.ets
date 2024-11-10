import TabsView from '../components/Tabs';
import { MediaWatching } from '../utils/mediaWatching';

@Entry
@Component
export struct Index {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    // 监听媒体查询
    new MediaWatching().init()
  }

  build() {
    Column() {
      TabsView()
    }
    .padding({ left: 15, right: 10 })
  }
}