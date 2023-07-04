import { Component, OnInit } from '@angular/core';
import { CategoryService } from '../category.service';
import { Router } from '@angular/router';
import { Category } from '../models/category.model';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { AddCategoryDialogComponent } from '../add-category-dialog/add-category-dialog.component';

@Component({
  selector: 'app-category-list',
  templateUrl: './category-list.component.html',
  styleUrls: ['./category-list.component.css']
})
export class CategoryListComponent implements OnInit {
  categories: Category[] = [];
  currentPage = 1;
  pageSize = 3;
  totalItems = 0;
  displayedCategories: Category[] = [];

  constructor(
    private categoryService: CategoryService,
    private router: Router,
    private dialog: MatDialog
  ) {}

  ngOnInit(): void {
    this.categoryService.getCategory().subscribe((data: Category[]) => {
      this.categories = data;
      this.totalItems = this.categories.length;
      this.updateDisplayedCategories();
    });
  }

  updateDisplayedCategories(): void {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    this.displayedCategories = this.categories.slice(startIndex, endIndex);
  }

  nextPage(): void {
    const totalPages = Math.ceil(this.totalItems / this.pageSize);
    if (this.currentPage < totalPages) {
      this.currentPage++;
      this.updateDisplayedCategories();
    }
  }

  canNext(): boolean {
    const totalPages = Math.ceil(this.totalItems / this.pageSize);
    return this.currentPage < totalPages;
  }

  previousPage(): void {
    if (this.currentPage > 1) {
      this.currentPage--;
      this.updateDisplayedCategories();
    }
  }

  canPrevious(): boolean {
    return this.currentPage > 1;
  }

  deleteCategory(index: number): void {
    this.categories.splice(index, 1);
    this.updateDisplayedCategories();
  }

  addCategory(): void {
    const dialogRef: MatDialogRef<AddCategoryDialogComponent> = this.dialog.open(AddCategoryDialogComponent, {
      width: '30%',
    });

    dialogRef.afterClosed().subscribe((result: Category) => {
      if (result) {
        // Yeni kategoriyi listeye ekle
        const lastCategoryId = this.categories.length > 0 ? this.categories[this.categories.length - 1].categoryId : 0;
        result.categoryId = lastCategoryId + 1;
        this.categories.push(result);
    
        // Diğer değişiklikleri güncelle
        this.totalItems++;
        this.updateDisplayedCategories();
      }
    });
  }
}
