import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { Router } from '@angular/router';
import { User } from '../models/user.model';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { AddUserDialogComponent } from '../add-user-dialog/add-user-dialog.component';
import { Post } from '../models/post.model';
import { Comment } from '../models/comment.model';
import { DeleteUserDialogComponentComponent } from '../delete-user-dialog-component/delete-user-dialog-component.component';


@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {
  users: User[] = [];
  currentPage: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;
  displayedUsers: User[] = [];
  showDeleteWarning: boolean = false;
  newUser: User = new User();
  posts: Post[] = []; // Gönderileri tutmak için posts dizisi
  comments: Comment[] = []; // Yorumları tutmak için comments dizisi


  constructor(
    private userService: UserService,
    private router: Router,
    private dialog: MatDialog
  ) {}

  ngOnInit() {
    this.userService.getUsers().subscribe((data: User[]) => {
      this.users = data;
      this.totalItems = this.users.length;
      this.updateDisplayedUsers();
    });
        // Gönderileri ve yorumları al
        this.userService.getPosts().subscribe((data: Post[]) => {
          this.posts = data as Post[];
          console.log("aaaa" + this.posts)
        });
    
        this.userService.getComments().subscribe((data: Comment[]) => {
          this.comments = data as Comment[];
        });
  }

  updateDisplayedUsers() {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    this.displayedUsers = this.users.slice(startIndex, endIndex);
  }

  nextPage() {
    const totalPages = Math.ceil(this.totalItems / this.pageSize);
    if (this.currentPage < totalPages) {
      this.currentPage++;
      this.updateDisplayedUsers();
    }
  }

  canNext(): boolean {
    const totalPages = Math.ceil(this.totalItems / this.pageSize);
    return this.currentPage < totalPages;
  }

  previousPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
      this.updateDisplayedUsers();
    }
  }

  canPrevious(): boolean {
    return this.currentPage > 1;
  }

  deleteUser(index: number) {
    if (this.users.length === 1) {
      this.showDeleteWarning = true;
    } else {
      const deletedUser = this.displayedUsers[index]; // Silinecek kullanıcıyı al
      const userIndex = this.users.indexOf(deletedUser); // Kullanıcının index'ini bul
  
      if (userIndex !== -1) {
        const userComments = this.comments.filter(comment => comment.userId === deletedUser.userId);
        const userPosts = this.posts.filter(post => post.userId === deletedUser.userId);
  
        if (userComments.length === 0 && userPosts.length === 0) {
          this.users.splice(userIndex, 1); // Kullanıcıyı users dizisinden çıkar
          const dialogRef = this.dialog.open(DeleteUserDialogComponentComponent, {
            width: '30%', // Dialog genişliği
            data: { message: 'The user has been successfully deleted.' } // Gönderilecek veri
          });
        } else {
          // Kullanıcıya ait gönderi veya yorum olduğu için silinemez
          // Uygun bir uyarı verilebilir veya işlem yapılmayabilir
          const dialogRef = this.dialog.open(DeleteUserDialogComponentComponent, {
            width: '30%', // Dialog genişliği
            data: { message: 'Since there are posts or comments associated with the user, it cannot be deleted' } // Gönderilecek veri
          });
        }
      }
  
      this.updateDisplayedUsers(); // displayedUsers dizisini güncelle
    }
  }
  
  addUser() {
    const dialogRef: MatDialogRef<AddUserDialogComponent> = this.dialog.open(AddUserDialogComponent, {
      width: '30%',
    });
  
    dialogRef.afterClosed().subscribe((result: User) => {
      if (result) {
        // Yeni kullanıcıyı listeye ekle
        const lastUserId = this.users.length > 0 ? this.users[this.users.length - 1].userId : 0;
        result.userId = lastUserId + 1;
        this.users.push(result);
  
        // Diğer değişiklikleri güncelle
        this.totalItems++;
        this.updateDisplayedUsers();
      }
    });
  }
  
}
