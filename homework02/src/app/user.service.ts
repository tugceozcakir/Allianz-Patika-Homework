import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private usersUrl = 'assets/users.json'; // Kullanıcıların bulunduğu dosya yolunu buraya yazın

  constructor(private http: HttpClient) {}

  getUsers(): Observable<any[]> {
    return this.http.get<any[]>(this.usersUrl);
  }

  updateUser(userDetails: any): Observable<any> {
    // Güncelleme işlemi yerine burada veriyi döndürüyoruz
    return of(userDetails);
  }

  addUser(newUser: any): Observable<any> {
    // Kullanıcı ekleme işlemi yerine burada veriyi döndürüyoruz
    return of(newUser);
  }
}
