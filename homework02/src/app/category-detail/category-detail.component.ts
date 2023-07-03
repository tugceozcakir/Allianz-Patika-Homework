import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CategoryService } from '../category.service';
import { Category } from '../models/category.model';

@Component({
  selector: 'app-category-detail',
  templateUrl: './category-detail.component.html',
  styleUrls: ['./category-detail.component.css']
})
export class CategoryDetailComponent implements OnInit {
  categoryId: string | null;
  categoryDetail: Category = new Category();

  initialCategoryDetails: Category = new Category();
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
    console.log('Category ID:', this.categoryId);
    this.fetchCategoryDetails();
  }

  fetchCategoryDetails() {
    if (this.categoryId !== null) {
      this.categoryService.getCategory().subscribe(
        (data: Category[]) => {
          console.log('Category Data:', data);
          this.categoryDetail = data.find((category) => category.categoryId === parseInt(this.categoryId!)) || new Category();
          console.log('Category Detail:', this.categoryDetail);
        },
        (error) => {
          console.error('Error fetching category details:', error);
        }
      );
    }
  }

  saveChanges() {
    this.categoryDetail.name = this.editedCategoryName;
    this.isChanged = false;

    this.changes = `Category Name: ${this.editedCategoryName}`;

    this.categoryService.updateCategory(this.categoryDetail).subscribe(
      (response) => {
        console.log('Category details successfully updated:', response);
        this.saveStatus = 'Changes saved successfully!';
      },
      (error) => {
        console.error('Error while saving category changes:', error);
        this.saveStatus = 'Error saving changes.';
      }
    );
  }

  onChange() {
    const isNameChanged = this.initialCategoryDetails.name !== this.editedCategoryName;
    this.isChanged = isNameChanged;
  }

}
