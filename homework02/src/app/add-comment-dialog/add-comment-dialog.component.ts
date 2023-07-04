import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Comment } from '../models/comment.model';

@Component({
  selector: 'app-add-comment-dialog',
  templateUrl: './add-comment-dialog.component.html',
  styleUrls: ['./add-comment-dialog.component.css']
})
export class AddCommentDialogComponent {
  commentForm: FormGroup;
  newComment: Comment = new Comment();
  postIdInvalid: boolean = false;
  userIdInvalid: boolean = false;

  constructor(
    private dialogRef: MatDialogRef<AddCommentDialogComponent>,
    private formBuilder: FormBuilder
  ) {
    this.initializeForm();
  }

  initializeForm() {
    this.commentForm = this.formBuilder.group({
      postId: ['', Validators.required],
      userId: ['', Validators.required],
      comment: ['', Validators.required],
      creationDate: ['', Validators.required],
      isConfirmed: [false]
    });
  }

  addComment() {
    if (this.commentForm.invalid) {
      return;
    }

    const postId = parseInt(this.commentForm.value.postId, 10);
    const userId = parseInt(this.commentForm.value.userId, 10);

    if (isNaN(postId)) {
      this.postIdInvalid = true;
      return;
    }

    if (isNaN(userId)) {
      this.userIdInvalid = true;
      return;
    }

    this.newComment.postId = postId;
    this.newComment.userId = userId;
    this.newComment.comment = this.commentForm.value.comment;
    this.newComment.creationDate = this.commentForm.value.creationDate;
    this.newComment.isConfirmed = this.commentForm.value.isConfirmed;

    this.dialogRef.close(this.newComment);
  }

  cancel() {
    this.dialogRef.close();
  }

  resetErrorFlags() {
    this.postIdInvalid = false;
    this.userIdInvalid = false;
  }
}
