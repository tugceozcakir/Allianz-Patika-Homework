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
  isChanged: boolean = false;

  // Düzenleme için gerekli değişkenler
  initialUserDetails: any = {}; // İlk kullanıcı detaylarını saklamak için değişken
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
          this.initialUserDetails = { ...this.userDetails }; // İlk kullanıcı detaylarını saklama
        },
        (error) => {
          console.error('Error fetching user details:', error);
        }
      );
    }
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
