import { Component, OnInit } from '@angular/core';
import { PostService } from '../post.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-post-list',
  templateUrl: './post-list.component.html',
  styleUrls: ['./post-list.component.css']
})
export class PostListComponent implements OnInit {
  posts: any[] = [];
  currentPage: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;
  displayedPosts: any[] = [];

  constructor(private postService: PostService, private router: Router) {}

  ngOnInit() {
    this.postService.getPosts().subscribe((data: any[]) => {
      this.posts = data;
      this.totalItems = this.posts.length;
      this.updateDisplayedPosts();
    });
  }

  updateDisplayedPosts() {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    this.displayedPosts = this.posts.slice(startIndex, endIndex);
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
    this.updateDisplayedPosts(); // displayedUsers dizisini güncelleyin
  }
  
}
