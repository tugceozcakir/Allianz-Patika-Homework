import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CategoryService } from '../category.service';

@Component({
  selector: 'app-category-detail',
  templateUrl: './category-detail.component.html',
  styleUrls: ['./category-detail.component.css']
})
export class CategoryDetailComponent implements OnInit {
  categoryId: string | null;
  categoryDetail: any = {};

  initialCategoryDetails: any = {};
  editedCategoryName: string = '';
  changes: string = '';
  saveStatus: string = '';
  isChanged: boolean = false;


  constructor(
    private route: ActivatedRoute,
    private categoryService: CategoryService
  ) {
    this.categoryId = null;
  }

  ngOnInit() {
    this.categoryId = this.route.snapshot.paramMap.get('categoryId');
    console.log('Comment ID:', this.categoryId);
    this.fetchCategoryDetails();
  }
  fetchCategoryDetails() {
    if (this.categoryId !== null) {
      this.categoryService.getCategory().subscribe(
        (data) => {
          console.log('Category Data:', data);
          this.categoryDetail = data.find((category) => category.categoryId === parseInt(this.categoryId!));
          console.log('Category Detail:', this.categoryDetail);
        },
        (error) => {
          console.error('Error fetching category details:', error);
        }
      );
    }
  }
  saveChanges() {
    this.categoryDetail.title = this.editedCategoryName;
    this.isChanged = false;

    this.changes = `Category Name: ${this.editedCategoryName}`;

    this.categoryService.updateCategory(this.categoryDetail).subscribe(
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
    const isTitleChanged = this.initialCategoryDetails.title !== this.editedCategoryName;
    this.isChanged = isTitleChanged
  }
  
}

