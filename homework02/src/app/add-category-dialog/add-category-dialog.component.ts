import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CategoryService } from '../category.service';
import { MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-add-category-dialog',
  templateUrl: './add-category-dialog.component.html',
  styleUrls: ['./add-category-dialog.component.css']
})
export class AddCategoryDialogComponent {
  categoryForm: FormGroup;

  constructor(
    private formBuilder: FormBuilder,
    private categoryService: CategoryService,
    private dialogRef: MatDialogRef<AddCategoryDialogComponent>
  ) {}

ngOnInit() {
this.initializeForm();
}

initializeForm() {
this.categoryForm = this.formBuilder.group({
name: ['', Validators.required],
creationDate: ['', Validators.required]
});
}

addCategory() {
if (this.categoryForm.invalid) {
return;
}
const newCategory = {
  name: this.categoryForm.value.name,
  creationDate: this.categoryForm.value.creationDate
};

this.categoryService.addCategory(newCategory).subscribe(() => {
  this.dialogRef.close(newCategory);
});
}

cancel() {
this.dialogRef.close();
}

}
