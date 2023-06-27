import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private apiUrl = './assets/users.json'; // JSON dosyasının yolunu belirtin

  constructor(private http: HttpClient) {}

  getUsers(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }

 /*
  updateUser(userDetails: any): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/${userDetails.userId}`, userDetails);
  }
  */
}
