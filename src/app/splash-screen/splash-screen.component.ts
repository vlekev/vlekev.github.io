import { Component, OnInit, Input } from '@angular/core';
import { SplashAnimationType } from "./../enum/splash-animation-type";

@Component({
  selector: 'app-splash-screen',
  templateUrl: './splash-screen.component.html',
  styleUrls: ['./splash-screen.component.scss']
})
export class SplashScreenComponent implements OnInit {
  windowWidth!: string;
  windowHeight!: string;
  splashTransition!: string;
  opacityChange: number = 1;
  displayChange: string = "";

  @Input() animationDuration: number = 0.5;
  @Input() duration: number = 1;
  @Input() animationType: SplashAnimationType = SplashAnimationType.SlideBottom;
  @Input() showSplash: boolean = true;

  ngOnInit(): void {
    setTimeout(() => {
      let transitionStyle = "";
      switch (this.animationType) {
        case SplashAnimationType.SlideLeft:
          this.windowWidth = "-" + window.innerWidth + "px";
          transitionStyle = "left " + this.animationDuration + "s";
          break;
        case SplashAnimationType.SlideRight:
          this.windowWidth = window.innerWidth + "px";
          transitionStyle = "left " + this.animationDuration + "s";
          break;
        case SplashAnimationType.SlideBottom:
          this.windowHeight = window.innerHeight + "px";
          transitionStyle = "top " + this.animationDuration + "s";
          break;
        case SplashAnimationType.SlideTop:
          this.windowHeight = "-" + window.innerHeight + "px";
          transitionStyle = "top " + this.animationDuration + "s";
          break;
        case SplashAnimationType.FadeOut:
          transitionStyle = "opacity " + this.animationDuration + "s";
          this.opacityChange = 0;
      }

      this.splashTransition = transitionStyle;

      setTimeout(() => {
        this.displayChange = "none";
        this.showSplash = !this.showSplash;
      }, this.animationDuration * 1000);
    }, this.duration * 1000);
  }
}
