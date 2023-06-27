import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class PostService {

  private apiUrl = './assets/posts.json'; // JSON path to file
  
  constructor(private http: HttpClient) {}

  getPosts() {
    return this.http.get<any[]>(this.apiUrl);
  }}
