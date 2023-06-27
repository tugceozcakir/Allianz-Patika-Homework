import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { UserService } from '../user.service';

@Component({
  selector: 'app-user-detail',
  templateUrl: './user-detail.component.html',
  styleUrls: ['./user-detail.component.css']
})
export class UserDetailComponent implements OnInit {
  userId: string | null;
  userDetails: any = {};

  // Düzenleme için gerekli değişkenler
  editedUsername: string = '';
  editedEmail: string = '';

  constructor(
    private route: ActivatedRoute,
    private userService: UserService
  ) {
    this.userId = null;
  }

  ngOnInit() {
    this.userId = this.route.snapshot.paramMap.get('userId');
    this.fetchUserDetails();
  }

  fetchUserDetails() {
    if (this.userId !== null) {
      this.userService.getUsers().subscribe(
        (data) => {
          this.userDetails = data.find((user) => user.userId === parseInt(this.userId!));
          this.editedUsername = this.userDetails.username; // Düzenleme için username'i atama
          this.editedEmail = this.userDetails.email; // Düzenleme için email'i atama
        },
        (error) => {
          console.error('Error fetching user details:', error);
        }
      );
    }
  }

  /*
  saveChanges() {
    // Düzenleme yapılan değerleri userDetails nesnesine kaydetme
    this.userDetails.username = this.editedUsername;
    this.userDetails.email = this.editedEmail;

    // UserService'i kullanarak değişiklikleri kaydetme (örnek olarak)
    this.userService.updateUser(this.userDetails).subscribe(
      (response) => {
        console.log('User details updated successfully:', response);
      },
      (error) => {
        console.error('Error updating user details:', error);
      }
    );
  }
  */
}
