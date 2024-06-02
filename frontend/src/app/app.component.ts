import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { NavbarComponent } from './navbar/navbar.component';

// import { HttpClientModule } from '@angular/common/http';
import { RouterOutlet } from '@angular/router';
// import { FormsModule } from '@angular/forms';
import { ScrapeDataComponent } from './scrape-data/scrape-data.component';


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [NavbarComponent, RouterModule, RouterOutlet, ScrapeDataComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'frontend';
}
