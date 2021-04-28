import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-order-items',
  templateUrl: './order-items.component.html',
  styles: [
  ]
})
export class OrderItemsComponent implements OnInit {

  constructor(@Inject(MAT_DIALOG_DATA) public data,
  public daologRef:MatDialogRef<OrderItemsComponent>) { }

  ngOnInit(): void {
  }

}
