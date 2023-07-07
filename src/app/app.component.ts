import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  constructor(private router: Router) {
    let webpath = localStorage.getItem('web-path');
    if (webpath) {
      localStorage.removeItem('web-path');
      this.router.navigate([webpath]);
    }
  }
}
