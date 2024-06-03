import { Component, OnInit } from '@angular/core';
import { ScrapeService } from '../services/scrape.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

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
  constructor(private scrapeService: ScrapeService) {}

  ngOnInit(): void {
    this.getProducts();
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
