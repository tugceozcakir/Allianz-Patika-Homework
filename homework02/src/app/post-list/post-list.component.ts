import { Component, OnInit } from '@angular/core';
import { PostService } from '../post.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Post } from '../models/post.model';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { AddPostDialogComponent } from '../add-post-dialog/add-post-dialog.component';

@Component({
  selector: 'app-post-list',
  templateUrl: './post-list.component.html',
  styleUrls: ['./post-list.component.css']
})
export class PostListComponent implements OnInit {
  posts: Post[] = [];
  currentPage: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;
  displayedPosts: Post[] = [];
  filteredPosts: Post[] = [];

  filter = {
    userId: undefined,
    postId: undefined,
    categoryId: undefined
  };

  constructor(
    private postService: PostService, 
    private router: Router,
    private route: ActivatedRoute,
    private dialog: MatDialog,
    ) {}

  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      this.filter.userId = params['userId'] ? +params['userId'] : undefined;
      this.filter.postId = params['postId'] ? +params['postId'] : undefined;
      this.filter.categoryId = params['categoryId'] ? +params['categoryId'] : undefined;
      this.applyFilters(this.filter.userId, this.filter.postId, this.filter.categoryId);
    });

    this.postService.getPosts().subscribe((data: Post[]) => {
      this.posts = data;
      this.totalItems = this.posts.length;
      this.updateDisplayedPosts();
    });
  }

  updateDisplayedPosts() {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    
    if (this.filter.userId || this.filter.postId || this.filter.categoryId) {
      this.filteredPosts = this.posts
        .filter(post => 
          (!this.filter.userId || post.userId === this.filter.userId) &&
          (!this.filter.postId || post.postId === this.filter.postId) &&
          (!this.filter.categoryId || post.categoryId === this.filter.categoryId)
        );
    } else {
      this.filteredPosts = this.posts;
    }
    
    this.displayedPosts = this.filteredPosts.slice(startIndex, endIndex);
  }
  

  nextPage() {
    const totalPages = Math.ceil(this.totalItems / this.pageSize);
    if (this.currentPage < totalPages) {
      this.currentPage++;
      this.updateDisplayedPosts();
    }
  }

  canNext(): boolean {
    const totalPages = Math.ceil(this.totalItems / this.pageSize);
    return this.currentPage < totalPages;
  }

  previousPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
      this.updateDisplayedPosts();
    }
  }

  canPrevious(): boolean {
    return this.currentPage > 1;
  }

  deletePost(index: number) {
    this.posts.splice(index, 1);
    this.updateDisplayedPosts(); // displayedPosts dizisini güncelleyin
  }

  applyFilters(userId: number, postId: number, categoryId: number) {
    this.filter.userId = userId;
    this.filter.postId = postId;
    this.filter.categoryId = categoryId;
    this.updateDisplayedPosts();
  }
  
  addPost() {
    const dialogRef: MatDialogRef<AddPostDialogComponent> = this.dialog.open(AddPostDialogComponent, {
      width: '30%',
    });
  
    dialogRef.afterClosed().subscribe((result: Post) => {
      if (result) {
        // Yeni kullanıcıyı listeye ekle
        const lastPostId = this.posts.length > 0 ? this.posts[this.posts.length - 1].postId : 0;
        result.postId = lastPostId + 1;
        this.posts.push(result);
  
        // Diğer değişiklikleri güncelle
        this.totalItems++;
        this.updateDisplayedPosts();
      }
    });
  }
  
}
