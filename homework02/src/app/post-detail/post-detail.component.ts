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
  postDetail: any = {
    postId: '',
    title: '',
    content: ''
  };
  initialPostDetails: any = {};
  editedTitle: string = '';
  editedContent: string = '';
  changes: string = '';
  saveStatus: string = '';
  isChanged: boolean = false;

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
          this.editedTitle = this.postDetail.title;
          this.editedContent = this.postDetail.content;
          this.initialPostDetails = { ...this.postDetail };
        },
        (error) => {
          console.error('Error fetching post details:', error);
        }
      );
    }
  }

  saveChanges() {
    this.postDetail.title = this.editedTitle;
    this.postDetail.content = this.editedContent;
    this.isChanged = false;

    this.changes = `Title: ${this.editedTitle}, Content: ${this.editedContent}`;

    this.postService.updatePost(this.postDetail).subscribe(
      (response) => {
        console.log('Kullanıcı detayları başarıyla güncellendi:', response);
        this.saveStatus = 'Changes saved successfully!';
      },
      (error) => {
        console.error('Kullanıcı detaylarını güncellerken hata oluştu:', error);
        this.saveStatus = 'Error saving changes.';
      }
    );
  }

  onChange() {
    const isTitleChanged = this.initialPostDetails.title !== this.editedTitle;
    const isContentChanged = this.initialPostDetails.content !== this.editedContent;
    this.isChanged = isTitleChanged || isContentChanged;
  }
}
