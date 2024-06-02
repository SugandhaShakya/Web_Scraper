import { Category } from './category.model';
import { Size } from './size.model';

export interface Product {
  id: number;
  name: string;
  description: string | null;
  price: string;
  details: string;
  created_at: string;
  updated_at: string;
  scraper_id: number;
  sizes: Size[];
  categories: Category[];
}
