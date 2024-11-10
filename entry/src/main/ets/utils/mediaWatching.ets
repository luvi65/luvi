import mediaQuery from '@ohos.mediaquery';

@Observed
export class MediaWatching {
  private sm: string = '(width<600vp)'
  private md: string = "(600vp<=width<840vp)"
  private lg: string = "(840vp<=width)"
  private type: 'sm' | 'md' | 'lg' = 'sm'

  init() {
    console.log("luvi > mediaQueryResult change " + this.type)
    // 小尺寸屏
    const smListener = mediaQuery.matchMediaSync(this.sm)
    smListener.on('change', (mediaQueryResult) => {
      this.onPortrait(mediaQueryResult)
    })
    // 中等尺寸屏
    const mdListener = mediaQuery.matchMediaSync(this.md)
    mdListener.on('change', (mediaQueryResult) => {
      this.onPortrait(mediaQueryResult)
    })
    // 大尺寸屏
    const lgListener = mediaQuery.matchMediaSync(this.lg)
    lgListener.on('change', (mediaQueryResult) => {
      this.onPortrait(mediaQueryResult)
    })
  }

  onPortrait(mediaQueryResult: mediaQuery.MediaQueryResult) {
    console.log("luvi > mediaQueryResult " + JSON.stringify(mediaQueryResult))
    if (mediaQueryResult.matches) {
      switch (mediaQueryResult.media as string) {
        case this.sm:
          this.type = 'sm'
          break
        case this.md:
          this.type = 'md'
          break
        case this.lg:
          this.type = 'lg'
          break
        default:
          break
      }
      console.log("luvi > mediaQueryResult change " + this.type)
      AppStorage.setOrCreate("currentMediaType", this.type)
    }
  }
}