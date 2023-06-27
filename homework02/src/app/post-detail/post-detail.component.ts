import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PostService } from '../post.service';

@Component({
  selector: 'app-post-detail',
  templateUrl: './post-detail.component.html',
  styleUrls: ['./post-detail.component.css']
})
export class PostDetailComponent implements OnInit {
  postId: string | null;
  postDetail: any = {};

  constructor(
    private route: ActivatedRoute,
    private postService: PostService
  ) {
    this.postId = null;
  }

  ngOnInit() {
    this.postId = this.route.snapshot.paramMap.get('postId');
    console.log(this.postId);
    this.fetchPostDetails();
  }

  fetchPostDetails() {
    if (this.postId !== null) {
      this.postService.getPosts().subscribe(
        (data) => {
          console.log('Post Data:', data);
          this.postDetail = data.find((post) => post.postId === parseInt(this.postId!));
        },
        (error) => {
          console.error('Error fetching post details:', error);
        }
      );
    }
  }
}
