import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommentService } from '../comment.service';

@Component({
  selector: 'app-comment-detail',
  templateUrl: './comment-detail.component.html',
  styleUrls: ['./comment-detail.component.css']
})
export class CommentDetailComponent implements OnInit {
  commentId: string | null;
  commentDetail: any = {};

  constructor(
    private route: ActivatedRoute,
    private commentService: CommentService
  ) {
    this.commentId = null;
  }

  ngOnInit() {
    this.commentId = this.route.snapshot.paramMap.get('id');
    console.log('Comment ID:', this.commentId);
    this.fetchCommentDetails();
  }
  
  
  fetchCommentDetails() {
    if (this.commentId !== null) {
      this.commentService.getComments().subscribe(
        (data) => {
          console.log('Comments Data:', data);
          this.commentDetail = data.find((comment) => comment.commentId === parseInt(this.commentId!));
          console.log('Comment Detail:', this.commentDetail);
        },
        (error) => {
          console.error('Error fetching post details:', error);
        }
      );
    }
  }
  
}
