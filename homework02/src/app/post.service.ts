import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class PostService {

  private apiUrl = './assets/posts.json'; // JSON path to file
  
  constructor(private http: HttpClient) {}

  getPosts() {
    return this.http.get<any[]>(this.apiUrl);
  }
  updatePost(postDetail: any): Observable<any> {
    // Güncelleme işlemi yerine burada veriyi döndürüyoruz
    return of(postDetail);
  }

  addPost(newPost: any): Observable<any> {
    // Kullanıcı ekleme işlemi yerine burada veriyi döndürüyoruz
    return of(newPost);
  }
}
