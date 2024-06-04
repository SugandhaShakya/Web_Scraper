import { Component, OnInit } from '@angular/core';
import { ScrapeService } from '../services/scrape.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Subject } from 'rxjs';
import { debounceTime, distinctUntilChanged, switchMap } from 'rxjs/operators';


@Component({
  selector: 'products',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './products.component.html',
  styleUrl: './products.component.css',
})
export class ProductsComponent implements OnInit {
  products: any[] = [];
  searchQuery: string = '';
  selectedProductDetails: any;
  private searchTerms = new Subject<string>();

  constructor(private scrapeService: ScrapeService) {}

  ngOnInit(): void {
    this.getProducts();
    this.searchTerms.pipe(
      debounceTime(350), 
      distinctUntilChanged(), 
      switchMap((term: string) => this.scrapeService.searchProducts(term))
    ).subscribe((data) => {
      this.products = data;
    });
  }

  getProducts(): void {
    this.scrapeService.getProducts().subscribe(
      (data) => {
        this.products = data;
      },
      (error) => {
        console.error('Error fetching products', error);
      }
    );
  }

  searchProducts() {
    this.scrapeService.searchProducts(this.searchQuery).subscribe((data) => {
      this.products = data;
    });
  }

  search(): void {
    this.searchTerms.next(this.searchQuery);
  }

  getDetails(details: string) {
    return Object.entries(JSON.parse(details)).map(([key, value]) => ({
      key,
      value,
    }));
  }

  showDetails(productDetails: any) {
    return (this.selectedProductDetails = productDetails);
  }

  closeDetails(): void {
    this.selectedProductDetails = null;
  }
}
