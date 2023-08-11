import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-docs',
  templateUrl: './docs.component.html',
  styleUrls: ['./docs.component.scss'],
})
export class DocsComponent {
  doc: string = "index";

  constructor(private route: ActivatedRoute) { }
  ngOnInit(): void {
      let doc = this.route.snapshot.paramMap.get('doc');
      this.doc = 'assets/docs/' + doc + '.md';
  }
}
