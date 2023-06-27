import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { Router } from '@angular/router';


@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {
  users: any[] = [];
  currentPage: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;
  displayedUsers: any[] = [];
  showDeleteWarning: boolean = false;


  constructor(private userService: UserService, private router: Router) {}

  ngOnInit() {
    this.userService.getUsers().subscribe((data: any[]) => {
      this.users = data;
      this.totalItems = this.users.length;
      this.updateDisplayedUsers();
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
      console.log(this.showDeleteWarning.valueOf())
    } else {
      this.users.splice(index, 1);
      this.updateDisplayedUsers();
      console.log(this.users.length)
    }
  }
  
  
  
  
}