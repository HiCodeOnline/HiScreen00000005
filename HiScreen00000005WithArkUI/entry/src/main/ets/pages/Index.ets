import { window } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {

  @Local topRectHeight: number = 0

  @Local bottomRectHeight: number = 0

  onPageShow() {
    const context = this.getUIContext().getHostContext();
    if (context) {
      window.getLastWindow(context).then((win: window.Window) => {
        win.setWindowLayoutFullScreen(true).catch();

        try {
          let topArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          this.topRectHeight = px2vp(topArea.topRect.height);
        } catch (error) {
          // TODO: Implement error handling.
        }

        try {
          let bottomArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
          this.bottomRectHeight = px2vp(bottomArea.bottomRect.height);
        } catch (error) {
          // TODO: Implement error handling.
        }
      }).catch();
    }
  }

  onPageHide() {
    const context = this.getUIContext().getHostContext();
    if (context) {
      window.getLastWindow(context).then((win: window.Window) => {

      }).catch();
    }
  }

  build() {
    RelativeContainer() {
      Stack() {
        Column() {
          ConfettiLayer()
        }
        .width('100%')
        .zIndex(50)
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Start)

        Column() {
          Button() {
            Image($r('app.media.icon_arrow_left'))
              .width(20)
              .height(20)
              .fillColor('#273436')
          }
          .borderRadius(24)
          .width(40)
          .height(40)
          .backdropBlur(20)
          .backgroundColor(Color.White)
          .shadow({
            radius: 20,
            color: '#dadada',
            offsetX: 0,
            offsetY: 0
          })

        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .zIndex(100)
        .margin({
          bottom: 16,
          top: this.topRectHeight
        })

        Column() {
          Column() {
            Stack() {
              Column()
                .width('100%')
                .height(180)
                .borderRadius(16)
                .backgroundColor('#f4f4f4')

              Image($r('app.media.img_demo1'))
                .width('100%')
                .height(180)
                .borderRadius(16)
                .objectFit(ImageFit.Cover)
                .rotate({ angle: -6 })
                .shadow({
                  radius: 12,
                  color: '#dadada',
                  offsetX: 0,
                  offsetY: 0
                })
            }
            .width('100%')
            .height(180)
          }
          .width('100%')
          .height(180)
          .margin({
            bottom: 52,
            top: this.topRectHeight + 56
          })

          Column() {
            Text('26th Anniversary Picnic (Manhattan)')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .margin({
            bottom: 16
          })
          .alignItems(HorizontalAlign.Start)

          Row() {
            Image($r('app.media.icon_time'))
              .width(16)
              .height(16)
              .fillColor('#535353')
              .margin({
                right: 6
              })

            Text('Sat, Jul 11 at 11:30 AM')
              .fontColor('#535353')
          }
          .width('100%')
          .alignItems(VerticalAlign.Center)
          .justifyContent(FlexAlign.Start)
          .margin({
            bottom: 16
          })

          Row() {
            Image($r('app.media.icon_place'))
              .width(16)
              .height(16)
              .fillColor('#535353')
              .margin({
                right: 6
              })

            Text('William Tecumseh Sherman Monument')
              .fontColor('#535353')
          }
          .width('100%')
          .alignItems(VerticalAlign.Center)
          .justifyContent(FlexAlign.Start)
          .margin({
            bottom: 16
          })

          Row() {
            Image($r('app.media.icon_users'))
              .width(16)
              .height(16)
              .fillColor('#535353')
              .margin({
                right: 6
              })

            Text('You and a guest')
              .fontColor('#535353')
          }
          .width('100%')
          .alignItems(VerticalAlign.Center)
          .justifyContent(FlexAlign.Start)
          .margin({
            bottom: 16
          })

          Column() {
            Button() {
              Text('Add to calender')
            }
            .width('100%')
            .height(52)
            .backgroundColor(Color.Black)
            .fontColor(Color.White)
            .borderRadius(26)
          }
          .width('100%')
          .margin({
            bottom: 16
          })

          Column() {
            Button() {
              Text('Forward to a friend')
            }
            .width('100%')
            .height(52)
            .backgroundColor('#f6f6f6')
            .fontColor(Color.Black)
            .borderRadius(26)
          }
          .width('100%')
          .margin({
            bottom: 16
          })

        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Start)
      }
      .width('100%')
      .height('100%')
      .alignContent(Alignment.TopStart)

      Column() {
        Row() {
          Text('Going')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({
              left: 20
            })

          Button(){
            Row() {
              Image($r('app.media.icon_share'))
                .width(16)
                .height(16)
                .fillColor('#4a3c6a')
                .margin({
                  right: 6
                })

              Text('Share')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
            }
            .alignItems(VerticalAlign.Center)
          }
          .width(120)
          .height(56)
          .fontColor('#4a3c6a')
          .backgroundColor('#faf2fe')
          .border({
            width: 1,
            color: '#DFDFDF'
          })
          .borderRadius(28)
          .margin({

          })
          .onClick((event: ClickEvent) => {

          })
        }
        .width('100%')
        .padding(4)
        .backgroundColor('#f3f3f3')
        .border({
          width: 1,
          color: '#dadada'
        })
        .borderRadius(32)
        .shadow({
          radius: 20,
          color: '#dadada',
          offsetX: 0,
          offsetY: 0
        })
        .margin({
          bottom: this.bottomRectHeight
        })
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .alignRules({
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
        left: { anchor: '__container__', align: HorizontalAlign.Start }
      })

    }
    .height('100%')
    .width('100%')
    .padding({
      left: 16,
      right: 16
    })
  }

}

@ComponentV2
struct ConfettiLayer {
  private colors: string[] = ['#FF6B6B', '#FFD93D', '#6BCB77', '#4D96FF', '#FF6FD8', '#FFA45B']
  @Local pieces: ConfettiData[] = []

  aboutToAppear() {
    for (let i = 0; i < 60; i++) {
      this.pieces.push({
        id: i,
        color: this.colors[Math.floor(Math.random() * this.colors.length)],
        startX: Math.random() * 360,
        delay: Math.random() * 2000,
        duration: 2500 + Math.random() * 2000,
        rotateAngle: Math.random() * 360,
      })
    }
  }

  build() {
    Stack() {
      ForEach(this.pieces, (item: ConfettiData) => {
        ConfettiPiece({
          color: item.color,
          startX: item.startX,
          delay: item.delay,
          duration: item.duration,
          rotateAngle: item.rotateAngle,
        })
      }, (item: ConfettiData) => item.id.toString())
    }
    .width('100%')
    .height('100%')
    .alignContent(Alignment.TopStart)
    .hitTestBehavior(HitTestMode.None)
  }
}

interface ConfettiData {
  id: number
  color: string
  startX: number
  delay: number
  duration: number
  rotateAngle: number
}

@ComponentV2
struct ConfettiPiece {
  @Param @Require color: string
  @Param @Require startX: number
  @Param @Require delay: number
  @Param @Require duration: number
  @Param @Require rotateAngle: number

  @Local translateY: number = -50
  @Local pieceOpacity: number = 1

  build() {
    Rect()
      .width(8)
      .height(16)
      .radius(2)
      .fill(this.color)
      .translate({ x: this.startX, y: this.translateY })
      .rotate({ angle: this.rotateAngle })
      .opacity(this.pieceOpacity)
      .onAppear(() => {
        setTimeout(() => {
          animateTo({
            duration: this.duration,
            curve: Curve.Linear,
            iterations: 1,
            playMode: PlayMode.Normal,
          }, () => {
            this.translateY = 500
            this.pieceOpacity = 0
          })
        }, this.delay)
      })
  }
}