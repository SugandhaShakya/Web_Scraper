import { ProductsComponent } from './products/products.component';
import { ScrapeDataComponent } from './scrape-data/scrape-data.component';
import { Routes } from '@angular/router';

export const routes: Routes = [
    // { path:'', component: HomeComponent},
    { path:'webScraper', component: ScrapeDataComponent},
    { path:'products', component: ProductsComponent},
    
    
];
