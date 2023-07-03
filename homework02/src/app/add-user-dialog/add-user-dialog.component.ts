import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { User } from '../models/user.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-add-user-dialog',
  templateUrl: './add-user-dialog.component.html',
  styleUrls: ['./add-user-dialog.component.css']
})
export class AddUserDialogComponent implements OnInit {
  newUser: User = new User();

  constructor(public dialogRef: MatDialogRef<AddUserDialogComponent>, public router: Router) {}

  ngOnInit() {}

  addUser() {
    if (this.isFormInvalid()) {
      return;
    }
    
    this.dialogRef.close(this.newUser);
  }

  cancel() {
    this.dialogRef.close();
  }

  isFormInvalid(): boolean {
    return !this.newUser.username || !this.newUser.email;
  }

  applyFilters(userId: number, postId: number, categoryId: number) {
    this.router.navigate([], {
      queryParams: { userId, postId, categoryId },
      queryParamsHandling: 'merge'
    });
  }
  
}
