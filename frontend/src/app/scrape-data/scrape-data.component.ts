import { Component} from '@angular/core';
import { ScrapeService } from '../services/scrape.service';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'scrape-data',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './scrape-data.component.html',
  styleUrl: './scrape-data.component.css',
})
export class ScrapeDataComponent{

  url: string = '';
  scrapedData: any = null;

  constructor(private scrapeService: ScrapeService) { }

  scrapeData() {
    this.scrapeService.scrapeData(this.url)

      .subscribe(data => {
        this.scrapedData = data;
        console.log(this.scrapedData)

      }, error => {
        console.error('Error fetching scraped data', error);
      });
  }
  getDetails(details: string) {
    return Object.entries(JSON.parse(details)).map(([key, value]) => ({ key, value }));
  }
}
