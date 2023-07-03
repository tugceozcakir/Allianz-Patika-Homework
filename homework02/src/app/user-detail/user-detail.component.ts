import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { UserService } from '../user.service';
import { User } from '../models/user.model';

@Component({
  selector: 'app-user-detail',
  templateUrl: './user-detail.component.html',
  styleUrls: ['./user-detail.component.css']
})
export class UserDetailComponent implements OnInit {
  userId: number | null;
  userDetails: User = new User(); 
  isChanged: boolean = false;

  // Düzenleme için gerekli değişkenler
  initialUserDetails: User = new User(); // İlk kullanıcı detaylarını saklamak için değişken
  editedUsername: string = '';
  editedEmail: string = '';
  changes: string = ''; // Yapılan değişiklikleri tutacak değişken
  saveStatus: string = ''; // Kaydetme durumunu tutacak değişken

  constructor(
    private route: ActivatedRoute,
    private userService: UserService
  ) {
    this.userId = null;
  }

  ngOnInit() {
    this.fetchUserDetails();
    this.subscribeToNewUser(); // Yeni kullanıcıları dinle
  }
  fetchUserDetails() {
    const userIdParam = this.route.snapshot.paramMap.get('userId');
    if (userIdParam !== null) {
      this.userId = +userIdParam;
      this.userService.getUsers().subscribe(
        (data: User | User[]) => {
          if (Array.isArray(data)) {
            this.userDetails = data.find((user) => user.userId === this.userId) || new User();
          } else {
            this.userDetails = data || new User();
          }
          
          if (this.userDetails.userId !== undefined) {
            this.editedUsername = this.userDetails.username;
            this.editedEmail = this.userDetails.email;
            this.initialUserDetails = { ...this.userDetails };
          } else {
            console.error('User not found');
          }
        },
        (error) => {
          console.error('Error fetching user details:', error);
        }
      );
    } else {
      this.userId = null;
    }
  }
  
  
  

  subscribeToNewUser() {
    this.userService.getNewUser().subscribe((user: User) => {
      if (user.userId === this.userId) {
        // Yeni eklenen kullanıcının detaylarını güncelle
        this.userDetails = user;
        this.editedUsername = this.userDetails.username;
        this.editedEmail = this.userDetails.email;
        this.initialUserDetails = { ...this.userDetails };
      }
    });
  }

  saveChanges() {
    // Düzenleme yapılan değerleri userDetails nesnesine kaydetme
    this.userDetails.username = this.editedUsername;
    this.userDetails.email = this.editedEmail;
    this.isChanged = false;

    // Değişiklikleri göstermek için changes değişkenini güncelleme
    this.changes = `Username: ${this.editedUsername}, Email: ${this.editedEmail}`;

    // UserService'i kullanarak değişiklikleri kaydetme (örnek olarak)
    this.userService.updateUser(this.userDetails).subscribe(
      (response) => {
        console.log('Kullanıcı detayları başarıyla güncellendi:', response);
        this.saveStatus = 'Changes saved successfully!';
      },
      (error) => {
        console.error('Kullanıcı detaylarını güncellerken hata oluştu:', error);
        this.saveStatus = 'Error saving changes.';
      }
    );
  }

  onChange() {
    const isUsernameChanged = this.initialUserDetails.username !== this.editedUsername;
    const isEmailChanged = this.initialUserDetails.email !== this.editedEmail;
    this.isChanged = isUsernameChanged || isEmailChanged;
  }
}
