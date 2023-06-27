import { Component, OnInit } from '@angular/core';
import { CategoryService } from '../category.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-category-list',
  templateUrl: './category-list.component.html',
  styleUrls: ['./category-list.component.css']
})
export class CategoryListComponent {
  categories: any[] = [];
  currentPage: number = 1;
  pageSize: number = 3;
  totalItems: number = 0;
  displayedCategories: any[] = [];

  constructor(private categoryService: CategoryService, private router: Router) {}


  ngOnInit() {
    this.categoryService.getCategory().subscribe((data: any[]) => {
      this.categories = data;
      this.totalItems = this.categories.length;
      this.updateDisplayedComments();
    });
  }

  updateDisplayedComments() {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    this.displayedCategories = this.categories.slice(startIndex, endIndex);
  }

  nextPage() {
    const totalPages = Math.ceil(this.totalItems / this.pageSize);
    if (this.currentPage < totalPages) {
      this.currentPage++;
      this.updateDisplayedComments();
    }
  }

  canNext(): boolean {
    const totalPages = Math.ceil(this.totalItems / this.pageSize);
    return this.currentPage < totalPages;
  }

  previousPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
      this.updateDisplayedComments();
    }
  }

  canPrevious(): boolean {
    return this.currentPage > 1;
  }

  deleteCategory(index: number) {
    this.categories.splice(index, 1);
    this.updateDisplayedComments(); // displayedUsers dizisini güncelleyin
  }
  
}
