import { Injectable, inject, } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ScrapeService{
  private apiUrl = 'http://localhost:3000/';


  constructor(private http: HttpClient) { }

  scrapeData(url: string) {
    return this.http.post<any>(`${this.apiUrl}scraper`, { url });
  }

  getProducts(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}products`);
  }

  searchProducts(query:string): Observable<any[]>{
    return this.http.get<any[]>(`${this.apiUrl}products/search?query=${query}`)
  }

}
