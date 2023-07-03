import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, Subject, of, throwError } from 'rxjs';
import { User } from './models/user.model';
import { Post } from './models/post.model';
import { Comment } from './models/comment.model';


@Injectable({
  providedIn: 'root'
})
export class UserService {
  private usersUrl = 'assets/users.json'; // Kullanıcıların bulunduğu dosya yolunu buraya yazın
  private newUserSubject: Subject<User> = new Subject<User>();
  private users: User[] = []; // Kullanıcıları saklamak için bir dizi tanımlayın
  private postsUrl = './assets/posts.json'
  private commentsUrl = './assets/comments.json'
  

  constructor(private http: HttpClient) {}

  getUsers(): Observable<User[]> {
    if (this.users.length > 0) {
      // Kullanıcılar zaten yüklü ise hemen veriyi döndür
      return of(this.users);
    } else {
      // Kullanıcıları henüz yüklemediysek http isteğiyle veriyi al
      return this.http.get<User[]>(this.usersUrl);
    }
  }

  //user'ın postları ve yorumları olup olmadığını kontrol etmek için
  getPosts(): Observable<Post[]> {
    return this.http.get<Post[]>(this.postsUrl);
  }

getComments(): Observable<any[]> {
  return this.http.get<any[]>(this.commentsUrl);
}

  updateUser(userDetails: User): Observable<User> {
    // Güncelleme işlemi yerine burada veriyi güncelle ve döndür
    const index = this.users.findIndex(user => user.userId === userDetails.userId);
    if (index !== -1) {
      this.users[index] = userDetails;
      return of(userDetails);
    } else {
      console.error('User not found');
      return throwError('User not found');
    }
  }

  addUser(newUser: User): Observable<User> {
    // Kullanıcı ekleme işlemi yerine burada veriyi ekle ve döndür
    this.users.push(newUser);
    this.newUserSubject.next(newUser);
    return of(newUser);
  }
  deleteUser(userId: number): Observable<void> {
    const url = `${this.usersUrl}/${userId}`;
    return this.http.delete<void>(url);
  }

  getNewUser(): Observable<User> {
    return this.newUserSubject.asObservable();
  }
}

