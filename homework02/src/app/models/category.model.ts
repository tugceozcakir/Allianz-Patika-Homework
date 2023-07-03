export class Category {
    categoryId: number;
    name: string;
    creationDate: Date;
  
    constructor() {
      this.categoryId = 0;
      this.name = '';
      this.creationDate = new Date();
    }
  }
  