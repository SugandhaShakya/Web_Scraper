import { Injectable, inject, } from '@angular/core';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class ScrapeService{
  private apiUrl = 'http://localhost:3000/';

  constructor(private http: HttpClient) { }

  scrapeData(url: string) {

    console.log(url);
    return this.http.post<any>(`${this.apiUrl}scraper`, { url });
  }
}
