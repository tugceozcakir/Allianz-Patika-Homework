import { Component, OnInit } from '@angular/core';
import { CommentService } from '../comment.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-comment-list',
  templateUrl: './comment-list.component.html',
  styleUrls: ['./comment-list.component.css']
})
export class CommentListComponent implements OnInit {
  comments: any[] = [];
  currentPage: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;
  displayedComments: any[] = [];
  categoryId: string | null = null;


  constructor(private userService: CommentService, private router: Router) {}

  ngOnInit() {
    this.userService.getComments().subscribe((data: any[]) => {
      this.comments = data;
      this.totalItems = this.comments.length;
      this.updateDisplayedComments();
    });
  }

  updateDisplayedComments() {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    this.displayedComments = this.comments.slice(startIndex, endIndex);
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

  deleteComment(index: number) {
    this.comments.splice(index, 1);
    this.updateDisplayedComments(); // displayedUsers dizisini güncelleyin
  }
  
}
