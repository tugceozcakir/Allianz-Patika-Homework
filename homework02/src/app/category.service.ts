import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  private apiUrl = './assets/categories.json'; // JSON path to file

  constructor(private http: HttpClient) {}

  getCategory(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }
  updateCategory(categoryDetail: any): Observable<any> {
    // Güncelleme işlemi yerine burada veriyi döndürüyoruz
    return of(categoryDetail);
  }

  addCategory(newCategory: any): Observable<any> {
    // Kullanıcı ekleme işlemi yerine burada veriyi döndürüyoruz
    return of(newCategory);
  }
}
