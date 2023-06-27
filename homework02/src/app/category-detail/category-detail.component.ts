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

  constructor(
    private route: ActivatedRoute,
    private categoryService: CategoryService
  ) {
    this.categoryId = null;
  }

  ngOnInit() {
    this.categoryId = this.route.snapshot.paramMap.get('categoryId');
    console.log('Comment ID:', this.categoryId);
    this.fetchCommentDetails();
  }
  fetchCommentDetails() {
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
  
  
}

